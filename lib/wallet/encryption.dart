import 'dart:typed_data';

import 'package:aioz/sodium/export.dart';

final kdfSalt = Uint8List.fromList('The AIOZJS salt.'.codeUnits);

final basicPasswordHashingOptions = KdfConfiguration(
  algorithm: 'argon2id',
  params: <String, dynamic>{
    'outputLength': 32,
    'opsLimit': 24,
    'memLimitKib': 12 * 1024,
  },
);

class KdfConfiguration {
  final String algorithm;
  final Map<String, dynamic> params;

  KdfConfiguration({required this.algorithm, this.params = const {}});

  KdfConfiguration.fromJson(Map<String, dynamic> json)
      : algorithm = json['algorithm'] as String,
        params = json['params'] as Map<String, dynamic>;

  Map<String, dynamic> toJson() => {
        'algorithm': algorithm,
        'params': params,
      };
}

bool isArgon2idOptions(Map<String, dynamic> options) {
  if (!(options['outputLength'] is int)) return false;
  if (!(options['memLimitKib'] is int)) return false;
  if (!(options['opsLimit'] is int)) return false;
  return true;
}

Uint8List executeKdf(String password, KdfConfiguration config) {
  switch (config.algorithm) {
    case 'argon2id':
      {
        if (!isArgon2idOptions(config.params)) {
          throw Exception('Invalid format of argon2id params');
        }

        return PasswordHash.hashString(
          password,
          kdfSalt,
          outlen: config.params['outputLength'] as int,
          memlimit: (config.params['memLimitKib'] as int) * 1024,
          opslimit: config.params['opsLimit'] as int,
          alg: PasswordHashAlgorithm.Argon2id13,
        );
      }
    default:
      throw Exception('Unsupported KDF algorithm');
  }
}

class EncryptionConfiguration {
  final String algorithm;
  final Map<String, dynamic>? params;

  EncryptionConfiguration({required this.algorithm, this.params});

  EncryptionConfiguration.fromJson(Map<String, dynamic> json)
      : algorithm = json['algorithm'] as String,
        params = json['params'] as Map<String, dynamic>?;

  Map<String, dynamic> toJson() => params != null
      ? {
          'algorithm': algorithm,
          'params': params,
        }
      : {'algorithm': algorithm};
}

const ALGO_XCHACHA20POLY1305_IETF = 'xchacha20poly1305-ietf';

Uint8List encrypt(
  Uint8List plaintext,
  Uint8List encryptionKey,
  EncryptionConfiguration config,
) {
  switch (config.algorithm) {
    case ALGO_XCHACHA20POLY1305_IETF:
      {
        final nonce = XChaCha20Poly1305Ietf.randomNonce();
        return Uint8List.fromList([
          ...nonce,
          ...XChaCha20Poly1305Ietf.encrypt(plaintext, nonce, encryptionKey)
        ]);
      }
    default:
      throw Exception(
          "Unsupported encryption algorithm: '${config.algorithm}'");
  }
}

Uint8List decrypt(
  Uint8List ciphertext,
  Uint8List encryptionKey,
  EncryptionConfiguration config,
) {
  switch (config.algorithm) {
    case ALGO_XCHACHA20POLY1305_IETF:
      {
        final nonce = ciphertext.sublist(
            0, Sodium.cryptoAeadXchacha20poly1305IetfNpubbytes);
        return XChaCha20Poly1305Ietf.decrypt(
            ciphertext.sublist(Sodium.cryptoAeadXchacha20poly1305IetfNpubbytes),
            nonce,
            encryptionKey);
      }
    default:
      throw Exception(
          "Unsupported encryption algorithm: '${config.algorithm}'");
  }
}
