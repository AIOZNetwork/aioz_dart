import 'dart:typed_data';

import 'encryption.dart';

class AccountData {
  final String bech32Address;
  final String hexAddress;
  final String algo;
  final Uint8List pubkey;

  AccountData({
    required this.bech32Address,
    required this.hexAddress,
    required this.algo,
    required this.pubkey,
  });
}

class AccountDataWithPrivkey extends AccountData {
  final Uint8List privkey;

  AccountDataWithPrivkey({
    required String bech32Address,
    required String hexAddress,
    required String algo,
    required Uint8List pubkey,
    required this.privkey,
  }) : super(
          bech32Address: bech32Address,
          hexAddress: hexAddress,
          algo: algo,
          pubkey: pubkey,
        );
}

class WalletSerialization {
  final String type;
  final KdfConfiguration kdf;
  final EncryptionConfiguration encryption;
  final String data;

  WalletSerialization({
    required this.type,
    required this.kdf,
    required this.encryption,
    required this.data,
  });

  WalletSerialization.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String,
        kdf = KdfConfiguration.fromJson(json['kdf'] as Map<String, dynamic>),
        encryption = EncryptionConfiguration.fromJson(
            json['encryption'] as Map<String, dynamic>),
        data = json['data'] as String;

  Map<String, dynamic> toJson() => {
        'type': type,
        'kdf': kdf.toJson(),
        'encryption': encryption.toJson(),
        'data': data,
      };
}

abstract class IWallet {
  String get algo;
  Uint8List publicKey(String bech23Address);
  Uint8List sign(String signerAddress, Uint8List data);
}
