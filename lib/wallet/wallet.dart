import 'dart:convert';
import 'dart:typed_data';

import 'package:aioz/aioz.dart';
import 'package:aioz/sodium/export.dart';
import 'package:hex/hex.dart';
import 'package:pointycastle/export.dart';

import 'encryption.dart';
import 'ethsecp256k1_utils.dart';

const SECP256K1_SERIALIZATION_TYPE_V1 = 'secp256k1wallet-v1';
const ETHSECP256K1_SERIALIZATION_TYPE_V1 = 'ethsecp256k1wallet-v1';

class WalletData {
  final Uint8List privkey;
  final String prefix;

  WalletData({required this.privkey, required this.prefix});

  WalletData.fromJson(Map<String, dynamic> json)
      : privkey = Uint8List.fromList(HEX.decode(json['privkey'] as String)),
        prefix = json['prefix'] as String;

  Map<String, dynamic> toJson() => {
        'privkey': HEX.encode(privkey),
        'prefix': prefix,
      };
}

/// Represents a wallet which contains the hex private key, the hex public key
/// and the hex address.
/// In order to create one properly, the [Wallet.derive] method should always
/// be used.
/// The associated [networkInfo] will be used when computing the [hexAddress]
/// and [bech32Address] associated with the wallet.
class Wallet extends IWallet {
  static const DEFAULT_ALGO = 'eth_secp256k1';
  static const DEFAULT_BIP39_PASSWORD = '';
  static const DEFAULT_HD_PATHS = ["m/44'/60'/0'/0/0"];
  static const DEFAULT_PREFIX = 'aioz';

  @override
  final String algo;
  final Uint8List _privkey;
  final Uint8List _pubkey;
  final String _prefix;

  Wallet._({
    required this.algo,
    required Uint8List privkey,
    required Uint8List pubkey,
    required String prefix,
  })  : _privkey = privkey,
        _pubkey = pubkey,
        _prefix = prefix;

  /// Derives the private key from the given [mnemonic] using the specified
  /// [networkInfo].
  factory Wallet.fromKey(
    Uint8List privkey, {
    String algo = DEFAULT_ALGO,
    String prefix = DEFAULT_PREFIX,
  }) {
    // Get the curve data
    final secp256k1 = ECCurve_secp256k1();
    final point = secp256k1.G;

    // Compute the curve point associated to the private key
    final bigInt = BigInt.parse(HEX.encode(privkey), radix: 16);
    final curvePoint = point * bigInt;

    // Get the public key
    final pubkey = curvePoint!.getEncoded();

    // Return the key bytes
    return Wallet._(
      algo: algo,
      privkey: privkey,
      pubkey: pubkey,
      prefix: prefix,
    );
  }

  /// Creates a new [Wallet] instance based on the existent [wallet] for
  /// the given [prefix]].
  factory Wallet.convert(
    Wallet wallet,
    String prefix,
  ) {
    return Wallet._(
      algo: wallet.algo,
      privkey: wallet._privkey,
      pubkey: wallet._pubkey,
      prefix: prefix,
    );
  }

  factory Wallet.deserialize(String serialization, String password) {
    final json = jsonDecode(serialization);
    if (!(json is Map)) {
      throw Exception('Root document is not an object.');
    }
    final doc = WalletSerialization.fromJson(json as Map<String, dynamic>);
    switch (doc.type) {
      case SECP256K1_SERIALIZATION_TYPE_V1:
      case ETHSECP256K1_SERIALIZATION_TYPE_V1:
        return Wallet._deserializeTypeV1(doc, password);
      default:
        throw Exception('Unsupported serialization type');
    }
  }

  factory Wallet._deserializeTypeV1(WalletSerialization doc, String password) {
    final encryptionKey = executeKdf(password, doc.kdf);
    return Wallet.deserializeWithEncryptionKey(doc, encryptionKey);
  }

  factory Wallet.deserializeWithEncryptionKey(
      WalletSerialization doc, Uint8List encryptionKey) {
    switch (doc.type) {
      case SECP256K1_SERIALIZATION_TYPE_V1:
      case ETHSECP256K1_SERIALIZATION_TYPE_V1:
        {
          final decryptedBytes = decrypt(
            base64Decode(doc.data),
            encryptionKey,
            doc.encryption,
          );
          final decryptedDocument =
              jsonDecode(String.fromCharCodes(decryptedBytes))
                  as Map<String, dynamic>;
          final decryptedData = WalletData.fromJson(decryptedDocument);
          return Wallet.fromKey(
            decryptedData.privkey,
            algo: doc.type == SECP256K1_SERIALIZATION_TYPE_V1
                ? 'secp256k1'
                : 'eth_secp256k1',
            prefix: decryptedData.prefix,
          );
        }
      default:
        throw Exception('Unsupported serialization type');
    }
  }

  Uint8List get _rawAddress {
    // Get the address
    switch (algo) {
      case 'secp256k1':
        {
          final sha256Digest = SHA256Digest().process(_pubkey);
          return RIPEMD160Digest().process(sha256Digest);
        }
      case 'eth_secp256k1':
        {
          final secp256k1 = ECCurve_secp256k1();
          final curvePoint = secp256k1.curve.decodePoint(_pubkey);
          final uncompressedPubkey = curvePoint?.getEncoded(false);
          final keccakDigest =
              KeccakDigest(256).process(uncompressedPubkey!.sublist(1));
          return keccakDigest.sublist(12, 32);
        }
      default:
        throw Exception('unsupported algorithm');
    }
  }

  String get _bech32Address => rawToBech32Address(_prefix, _rawAddress);

  String get _hexAddress => rawToHexAddress(_rawAddress);

  @override
  Uint8List publicKey(String bech32Address) {
    if (bech32Address != _bech32Address) {
      throw Exception('invalid bech32 address');
    }
    return _pubkey;
  }

  List<AccountData> get accounts {
    return [
      AccountData(
        bech32Address: _bech32Address,
        hexAddress: _hexAddress,
        algo: algo,
        pubkey: _pubkey,
      )
    ];
  }

  List<AccountDataWithPrivkey> get accountsWithPrivkey {
    return [
      AccountDataWithPrivkey(
        bech32Address: _bech32Address,
        hexAddress: _hexAddress,
        algo: algo,
        pubkey: _pubkey,
        privkey: _privkey,
      )
    ];
  }

  /// Returns the associated [privateKey] as an [ECPrivateKey] instance.
  ECPrivateKey get _ecPrivateKey {
    final privateKeyInt = BigInt.parse(HEX.encode(_privkey), radix: 16);
    return ECPrivateKey(privateKeyInt, ECCurve_secp256k1());
  }

  /// Returns the associated [publicKey] as an [ECPublicKey] instance.
  ECPublicKey get _ecPublicKey {
    final secp256k1 = ECCurve_secp256k1();
    final point = secp256k1.G;
    final curvePoint = point * _ecPrivateKey.d;
    return ECPublicKey(curvePoint, ECCurve_secp256k1());
  }

  /// Normalizes the given [signature] using the provided [curveParams].
  /// This is used to create signatures that are always in the lower-S form, to
  /// make sure that they cannot be tamped with the alternative S value.
  /// More info can be found here: https://tinyurl.com/2yfurry7
  ECSignature _normalizeECSignature(
    ECSignature signature,
    ECDomainParameters curveParams,
  ) {
    var normalizedS = signature.s;
    if (normalizedS.compareTo(curveParams.n >> 1) > 0) {
      normalizedS = curveParams.n - normalizedS;
    }
    return ECSignature(signature.r, normalizedS);
  }

  /// Hashes the given [data] with SHA-256, and then sign the hash using the
  /// private key associated with this wallet, returning the signature
  /// encoded as a 64 bytes array.
  @override
  Uint8List sign(String signerAddress, Uint8List data) {
    if (signerAddress != _bech32Address) {
      throw Exception('invalid bech32 address');
    }

    Uint8List hash;
    switch (algo) {
      case 'secp256k1':
        {
          hash = SHA256Digest().process(data);
        }
        break;
      default:
        {
          hash = KeccakDigest(256).process(data);
        }
        break;
    }
    final ecPrivateKey = _ecPrivateKey;
    final ecdsaSigner = ECDSASigner(null, HMac(SHA256Digest(), 64))
      ..init(true, PrivateKeyParameter(ecPrivateKey));

    final params = ECCurve_secp256k1();
    final ecSignature = ecdsaSigner.generateSignature(hash) as ECSignature;
    final normalized = _normalizeECSignature(ecSignature, params);
    final rBytes = normalized.r.toUin8List();
    final sBytes = normalized.s.toUin8List();

    switch (algo) {
      case 'secp256k1':
        {
          var sigBytes = Uint8List(64);
          copy(rBytes, 32 - rBytes.length, 32, sigBytes);
          copy(sBytes, 64 - sBytes.length, 64, sigBytes);
          return sigBytes;
        }
      default:
        {
          final uncompressedPubkey = _ecPublicKey.Q!.getEncoded(false);
          final pk = bytesToUnsignedInt(
              Uint8List.fromList(uncompressedPubkey.sublist(1)));
          //Implementation for calculating v naively taken from there, I don't understand
          //any of this.
          //https://github.com/web3j/web3j/blob/master/crypto/src/main/java/org/web3j/crypto/Sign.java
          var recId = -1;
          for (var i = 0; i < 4; i++) {
            final k = recoverFromSignature(i, normalized, hash, params);
            if (k == pk) {
              recId = i;
              break;
            }
          }

          if (recId == -1) {
            throw Exception(
                'Could not construct a recoverable key. This should never happen');
          }

          var sigBytes = Uint8List(65);
          copy(rBytes, 32 - rBytes.length, 32, sigBytes);
          copy(sBytes, 64 - sBytes.length, 64, sigBytes);
          sigBytes[64] = recId + 27;
          return sigBytes;
        }
    }
  }

  // @override
  // List<Object> get props {
  //   return [
  //     networkInfo,
  //     algo,
  //     address,
  //     privateKey,
  //     publicKey,
  //   ];
  // }

  // @override
  // String toString() {
  //   return '{ '
  //       'networkInfo: $networkInfo, '
  //       'algo: $algo, '
  //       'address: $address, '
  //       'publicKey: $publicKey '
  //       '}';
  // }

  String serialize(String password) {
    final kdfConfiguration = basicPasswordHashingOptions;
    final encryptionKey = executeKdf(password, kdfConfiguration);
    return serializeWithEncryptionKey(encryptionKey, kdfConfiguration);
  }

  String serializeWithEncryptionKey(
      Uint8List encryptionKey, KdfConfiguration kdfConfiguration) {
    Sodium.init();
    final data = WalletData(privkey: _privkey, prefix: _prefix);
    final dataRaw = Uint8List.fromList(jsonEncode(data).codeUnits);

    final encryptionConfiguration = EncryptionConfiguration(
      algorithm: ALGO_XCHACHA20POLY1305_IETF,
    );
    final encryptedData =
        encrypt(dataRaw, encryptionKey, encryptionConfiguration);

    final out = WalletSerialization(
      type: algo == 'secp256k1'
          ? SECP256K1_SERIALIZATION_TYPE_V1
          : ETHSECP256K1_SERIALIZATION_TYPE_V1,
      kdf: kdfConfiguration,
      encryption: encryptionConfiguration,
      data: base64Encode(encryptedData),
    );
    return jsonEncode(out);
  }
}
