import 'dart:convert';
import 'dart:typed_data';

import 'package:aioz/aioz.dart';
import 'package:aioz/wallet/bech32_encoder.dart';
import 'package:equatable/equatable.dart';
import 'package:hex/hex.dart';
import 'package:pointycastle/digests/keccak.dart';
import 'package:pointycastle/export.dart';

import './ethsecp256k1_utils.dart';

/// Represents a wallet which contains the hex private key, the hex public key
/// and the hex address.
/// In order to create one properly, the [Wallet.derive] method should always
/// be used.
/// The associated [networkInfo] will be used when computing the [hexAddress]
/// and [bech32Address] associated with the wallet.
class Wallet extends Equatable {
  static const DERIVATION_PATH = "m/44'/60'/0'/0/0";
  static const ALGO = 'ethsecp256k1';

  final Uint8List address;
  final Uint8List privateKey;
  final Uint8List publicKey;

  final String algo;

  final NetworkInfo networkInfo;

  Wallet({
    required this.networkInfo,
    required this.algo,
    required this.address,
    required this.privateKey,
    required this.publicKey,
  });

  /// Derives the private key from the given [mnemonic] using the specified
  /// [networkInfo].
  factory Wallet.derive(
    List<String> mnemonic,
    NetworkInfo networkInfo, {
    String derivationPath = DERIVATION_PATH,
    String algo = ALGO,
  }) {
    // Validate the mnemonic
    if (!Bip39.validateMnemonic(mnemonic)) {
      throw Exception('Invalid mnemonic');
    }

    // Convert the mnemonic to a BIP32 instance
    final seed = Bip39.mnemonicToSeed(mnemonic);
    final root = Bip32.fromSeed(seed);

    // Get the node from the derivation path
    final derivedNode = root.derivePath(derivationPath);

    // Get the curve data
    final secp256k1 = ECCurve_secp256k1();
    final point = secp256k1.G;

    // Compute the curve point associated to the private key
    final bigInt = BigInt.parse(HEX.encode(derivedNode.privateKey!), radix: 16);
    final curvePoint = point * bigInt;

    // Get the public key
    Uint8List publicKeyBytes;

    // Get the address
    Uint8List address;
    switch (algo) {
      case 'secp256k1':
        {
          publicKeyBytes = curvePoint!.getEncoded();
          final sha256Digest = SHA256Digest().process(publicKeyBytes);
          address = RIPEMD160Digest().process(sha256Digest);
        }
        break;
      default:
        {
          publicKeyBytes = curvePoint!.getEncoded(false);
          final keccakDigest =
              KeccakDigest(256).process(publicKeyBytes.sublist(1));
          address = keccakDigest.sublist(12, 32);
        }
        break;
    }

    // Return the key bytes
    return Wallet(
      algo: algo,
      address: address,
      publicKey: publicKeyBytes,
      privateKey: derivedNode.privateKey!,
      networkInfo: networkInfo,
    );
  }

  /// Generated a new random [Wallet] using the specified [networkInfo]
  /// and the optional [derivationPath].
  factory Wallet.random(
    NetworkInfo networkInfo, {
    String derivationPath = DERIVATION_PATH,
  }) {
    return Wallet.derive(
      Bip39.generateMnemonic(strength: 256),
      networkInfo,
      derivationPath: derivationPath,
    );
  }

  /// Creates a new [Wallet] instance based on the existent [wallet] for
  /// the given [networkInfo].
  factory Wallet.convert(
    Wallet wallet,
    NetworkInfo networkInfo,
  ) {
    return Wallet(
      networkInfo: networkInfo,
      algo: wallet.algo,
      address: wallet.address,
      privateKey: wallet.privateKey,
      publicKey: wallet.publicKey,
    );
  }

  /// Creates a new [Wallet] instance from the given [json] and [privateKey].
  factory Wallet.fromJson(
    Map<String, dynamic> json,
    Uint8List privateKey,
  ) {
    return Wallet(
      algo: json['algo'] as String,
      address: Uint8List.fromList(
          HEX.decode((json['hex_address'] as String).substring(2))),
      publicKey: Uint8List.fromList(HEX.decode(json['public_key'] as String)),
      privateKey: privateKey,
      networkInfo: NetworkInfo.fromJson(
        json['network_info'] as Map<String, dynamic>,
      ),
    );
  }

  /// Returns the associated [address] as a Bech32 string.
  String get bech32Address {
    return Bech32Encoder.encode(networkInfo.bech32Hrp, address);
  }

  /// Returns the associated [address] as a hex string.
  String get hexAddress {
    return '0x${HEX.encode(address)}';
  }

  String get hexEip55Address {
    // https://eips.ethereum.org/EIPS/eip-55#implementation
    final hex = HEX.encode(address);
    final hash = HEX.encode(KeccakDigest(256).process(ascii.encode(hex)));

    final eip55 = StringBuffer('0x');
    for (var i = 0; i < hex.length; i++) {
      if (int.parse(hash[i], radix: 16) >= 8) {
        eip55.write(hex[i].toUpperCase());
      } else {
        eip55.write(hex[i]);
      }
    }

    return eip55.toString();
  }

  /// Returns the associated [privateKey] as an [ECPrivateKey] instance.
  ECPrivateKey get _ecPrivateKey {
    final privateKeyInt = BigInt.parse(HEX.encode(privateKey), radix: 16);
    return ECPrivateKey(privateKeyInt, ECCurve_secp256k1());
  }

  /// Returns the associated [publicKey] as an [ECPublicKey] instance.
  ECPublicKey get ecPublicKey {
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
  Uint8List sign(Uint8List data) {
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
    final ecdsaSigner = ECDSASigner(null, HMac(SHA256Digest(), 64))
      ..init(true, PrivateKeyParameter(_ecPrivateKey));

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
          final pk =
              bytesToUnsignedInt(Uint8List.fromList(publicKey.sublist(1)));
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

  /// Converts the current [Wallet] instance into a JSON object.
  /// Note that the private key is not serialized for safety reasons.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'algo': algo,
      'hex_address': hexAddress,
      'bech32_address': bech32Address,
      'public_key': HEX.encode(publicKey),
      'network_info': networkInfo.toJson(),
    };
  }

  @override
  List<Object> get props {
    return [
      networkInfo,
      algo,
      address,
      privateKey,
      publicKey,
    ];
  }

  @override
  String toString() {
    return '{ '
        'networkInfo: $networkInfo, '
        'algo: $algo, '
        'address: $address, '
        'publicKey: $publicKey '
        '}';
  }
}
