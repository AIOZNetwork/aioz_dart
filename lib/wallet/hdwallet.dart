import 'dart:convert';
import 'dart:typed_data';

import 'package:aioz/aioz.dart';
import 'package:aioz/sodium/export.dart';
import 'package:bip39/bip39.dart';
import 'package:hex/hex.dart';
import 'package:pointycastle/export.dart';

import 'encryption.dart';
import 'ethsecp256k1_utils.dart';

const SECP256K1_HD_SERIALIZATION_TYPE_V1 = 'secp256k1hdwallet-v1';
const ETHSECP256K1_HD_SERIALIZATION_TYPE_V1 = 'ethsecp256k1hdwallet-v1';

class Derivation {
  final String hdPath;
  final String prefix;

  Derivation({required this.hdPath, required this.prefix});

  Derivation.fromJson(Map<String, dynamic> json)
      : hdPath = json['hdPath'] as String,
        prefix = json['prefix'] as String;

  Map<String, dynamic> toJson() => {
        'hdPath': hdPath,
        'prefix': prefix,
      };
}

class HdWalletData {
  final String mnemonic;
  final List<Derivation> accounts;

  HdWalletData({required this.mnemonic, required this.accounts});

  HdWalletData.fromJson(Map<String, dynamic> json)
      : mnemonic = json['mnemonic'] as String,
        accounts = (json['accounts'] as List)
            .map<Derivation>(
                (a) => Derivation.fromJson(a as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'mnemonic': mnemonic,
        'accounts': accounts.map((a) => a.toJson()).toList(),
      };
}

/// Represents a wallet which contains the hex private key, the hex public key
/// and the hex address.
/// In order to create one properly, the [HdWallet.derive] method should always
/// be used.
/// The associated [networkInfo] will be used when computing the [hexAddress]
/// and [bech32Address] associated with the wallet.
class HdWallet extends IWallet {
  static const DEFAULT_ALGO = 'eth_secp256k1';
  static const DEFAULT_BIP39_PASSWORD = '';
  static const DEFAULT_HD_PATHS = ["m/44'/60'/0'/0/0"];
  static const DEFAULT_PREFIX = 'aioz';

  @override
  final String algo;
  final String mnemonic;
  final Bip32 _root;
  final List<Derivation> _accounts;

  HdWallet._({
    required this.algo,
    required String mnemonic,
    required Bip32 root,
    String? prefix,
    List<String>? hdPaths,
  })  : mnemonic = mnemonic,
        _root = root,
        _accounts = (hdPaths ?? DEFAULT_HD_PATHS)
            .map<Derivation>((hdPath) => Derivation(
                  hdPath: hdPath,
                  prefix: prefix ?? DEFAULT_PREFIX,
                ))
            .toList();

  /// Derives the private key from the given [mnemonic] using the specified
  /// [networkInfo].
  factory HdWallet.fromMnemonic(
    String mnemonic, {
    String algo = DEFAULT_ALGO,
    List<String> hdPaths = DEFAULT_HD_PATHS,
    String prefix = DEFAULT_PREFIX,
    String bip39Password = DEFAULT_BIP39_PASSWORD,
  }) {
    // Validate the mnemonic
    if (!validateMnemonic(mnemonic)) {
      throw Exception('Invalid mnemonic');
    }

    // Convert the mnemonic to a BIP32 instance
    final seed = mnemonicToSeed(mnemonic, passphrase: bip39Password);
    final root = Bip32.fromSeed(seed);

    // Return the key bytes
    return HdWallet._(
      algo: algo,
      mnemonic: mnemonic,
      root: root,
      prefix: prefix,
      hdPaths: hdPaths,
    );
  }

  /// Generated a new random [HdWallet]
  factory HdWallet.random({
    String algo = DEFAULT_ALGO,
    String bip39Password = DEFAULT_BIP39_PASSWORD,
    List<String> hdPaths = DEFAULT_HD_PATHS,
    String prefix = DEFAULT_PREFIX,
  }) {
    return HdWallet.fromMnemonic(
      generateMnemonic(strength: 256),
      algo: algo,
      prefix: prefix,
      hdPaths: hdPaths,
      bip39Password: bip39Password,
    );
  }

  /// Creates a new [HdWallet] instance based on the existent [wallet] for
  /// the given [prefix]].
  factory HdWallet.convert(
    HdWallet wallet,
    String prefix,
  ) {
    return HdWallet._(
      algo: wallet.algo,
      mnemonic: wallet.mnemonic,
      root: wallet._root,
      prefix: prefix,
      hdPaths: wallet._accounts.map<String>((a) => a.hdPath).toList(),
    );
  }

  factory HdWallet.deserialize(String serialization, String password,
      {String bip39Password = ''}) {
    final json = jsonDecode(serialization);
    if (!(json is Map)) {
      throw Exception('Root document is not an object.');
    }
    final doc = WalletSerialization.fromJson(json as Map<String, dynamic>);
    switch (doc.type) {
      case SECP256K1_HD_SERIALIZATION_TYPE_V1:
      case ETHSECP256K1_HD_SERIALIZATION_TYPE_V1:
        return HdWallet._deserializeTypeV1(doc, password,
            bip39Password: bip39Password);
      default:
        throw Exception('Unsupported serialization type');
    }
  }

  factory HdWallet._deserializeTypeV1(WalletSerialization doc, String password,
      {String bip39Password = ''}) {
    final encryptionKey = executeKdf(password, doc.kdf);
    return HdWallet.deserializeWithEncryptionKey(doc, encryptionKey,
        bip39Password: bip39Password);
  }

  factory HdWallet.deserializeWithEncryptionKey(
      WalletSerialization doc, Uint8List encryptionKey,
      {String bip39Password = ''}) {
    switch (doc.type) {
      case SECP256K1_HD_SERIALIZATION_TYPE_V1:
      case ETHSECP256K1_HD_SERIALIZATION_TYPE_V1:
        {
          final decryptedBytes = decrypt(
            base64Decode(doc.data),
            encryptionKey,
            doc.encryption,
          );
          final decryptedDocument =
              jsonDecode(String.fromCharCodes(decryptedBytes))
                  as Map<String, dynamic>;
          final decryptedData = HdWalletData.fromJson(decryptedDocument);
          final firstPrefix = decryptedData.accounts[0].prefix;
          if (!decryptedData.accounts
              .every((account) => account.prefix == firstPrefix)) {
            throw Exception('Accounts do not all have the same prefix');
          }
          final hdPaths =
              decryptedData.accounts.map((account) => account.hdPath).toList();
          return HdWallet.fromMnemonic(
            decryptedData.mnemonic,
            algo: doc.type == SECP256K1_HD_SERIALIZATION_TYPE_V1
                ? 'secp256k1'
                : 'eth_secp256k1',
            hdPaths: hdPaths,
            prefix: firstPrefix,
            bip39Password: bip39Password,
          );
        }
      default:
        throw Exception('Unsupported serialization type');
    }
  }

  @override
  Uint8List publicKey(String bech32Address) {
    return accountsWithPrivkey
        .firstWhere((a) => a.bech32Address == bech32Address)
        .pubkey;
  }

  List<AccountData> get accounts {
    return accountsWithPrivkey
        .map((account) => AccountData(
              algo: account.algo,
              pubkey: account.pubkey,
              bech32Address: account.bech32Address,
              hexAddress: account.hexAddress,
            ))
        .toList();
  }

  List<AccountDataWithPrivkey> get accountsWithPrivkey {
    return _accounts.map((account) {
      // Get the node from the derivation path
      final derivedNode = _root.derivePath(account.hdPath);

      // Get the curve data
      final secp256k1 = ECCurve_secp256k1();
      final point = secp256k1.G;

      // Compute the curve point associated to the private key
      final bigInt =
          BigInt.parse(HEX.encode(derivedNode.privateKey!), radix: 16);
      final curvePoint = point * bigInt;

      // Get the public key
      final publicKeyBytes = curvePoint!.getEncoded();

      // Get the address
      Uint8List address;
      switch (algo) {
        case 'secp256k1':
          {
            final sha256Digest = SHA256Digest().process(publicKeyBytes);
            address = RIPEMD160Digest().process(sha256Digest);
          }
          break;
        case 'eth_secp256k1':
          {
            final uncompressedPublicKeyBytes = curvePoint.getEncoded(false);
            final keccakDigest = KeccakDigest(256)
                .process(uncompressedPublicKeyBytes.sublist(1));
            address = keccakDigest.sublist(12, 32);
          }
          break;
        default:
          throw Exception('unsupported algorithm');
      }

      return AccountDataWithPrivkey(
          bech32Address: rawToBech32Address(account.prefix, address),
          hexAddress: rawToHexAddress(address),
          algo: algo,
          pubkey: publicKeyBytes,
          privkey: derivedNode.privateKey!);
    }).toList();
  }

  /// Returns the associated [privateKey] as an [ECPrivateKey] instance.
  ECPrivateKey _ecPrivateKey(String signerAddress) {
    final account =
        accountsWithPrivkey.firstWhere((a) => a.bech32Address == signerAddress);
    final privateKeyInt = BigInt.parse(HEX.encode(account.privkey), radix: 16);
    return ECPrivateKey(privateKeyInt, ECCurve_secp256k1());
  }

  /// Returns the associated [publicKey] as an [ECPublicKey] instance.
  ECPublicKey ecPublicKey(ECPrivateKey ecPrivateKey) {
    final secp256k1 = ECCurve_secp256k1();
    final point = secp256k1.G;
    final curvePoint = point * ecPrivateKey.d;
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
    final ecPrivateKey = _ecPrivateKey(signerAddress);
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
          final uncompressedPubkey =
              ecPublicKey(ecPrivateKey).Q!.getEncoded(false);
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
    final data = HdWalletData(mnemonic: mnemonic, accounts: _accounts);
    final dataRaw = Uint8List.fromList(jsonEncode(data).codeUnits);

    final encryptionConfiguration = EncryptionConfiguration(
      algorithm: ALGO_XCHACHA20POLY1305_IETF,
    );
    final encryptedData =
        encrypt(dataRaw, encryptionKey, encryptionConfiguration);

    final out = WalletSerialization(
      type: algo == 'secp256k1'
          ? SECP256K1_HD_SERIALIZATION_TYPE_V1
          : ETHSECP256K1_HD_SERIALIZATION_TYPE_V1,
      kdf: kdfConfiguration,
      encryption: encryptionConfiguration,
      data: base64Encode(encryptedData),
    );
    return jsonEncode(out);
  }
}
