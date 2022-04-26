import 'dart:convert';
import 'dart:typed_data';

import 'package:hex/hex.dart';
import 'package:pointycastle/digests/keccak.dart';

import 'bech32_encoder.dart';

String rawToBech32Address(String humanReadablePart, Uint8List data) {
  return Bech32Encoder.encode(humanReadablePart, data);
}

String rawToHexAddress(Uint8List data) {
  // https://eips.ethereum.org/EIPS/eip-55#implementation
  final hex = HEX.encode(data);
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

String hexToBech32Address(String humanReadablePart, String hexAddress) {
  if (hexAddress.startsWith('0x')) {
    hexAddress = hexAddress.substring(2);
  }
  final raw = Uint8List.fromList(HEX.decode(hexAddress.toLowerCase()));
  return rawToBech32Address(humanReadablePart, raw);
}

String bech32ToHexAddress(String bech32Address) {
  final raw = Bech32Encoder.decode(bech32Address);
  return rawToHexAddress(raw);
}
