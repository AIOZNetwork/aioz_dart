import 'dart:typed_data';

import 'package:aioz/aioz.dart';
import 'package:fixnum/fixnum.dart';
import 'package:aioz/proto/ethermint/types/v1/account.pb.dart' as acc;
import 'package:hex/hex.dart';
import 'package:pointycastle/digests/keccak.dart';

import 'account.dart';

final emptyCodeHash = HEX.encode(KeccakDigest(256).process(Uint8List(0)));

const int AccountTypeEOA = 1;
const int AccountTypeContract = 2;

abstract class EthAccountI extends AccountI {
  String get ethAddress;

  String get codeHash;

  int get type;

  set setCodeHash(String codeHash);
}

class EthAccount extends EthAccountI {
  final acc.EthAccount account;

  @override
  String get address {
    return account.baseAccount.address;
  }

  @override
  Any get pubKey {
    return account.baseAccount.pubKey;
  }

  @override
  Int64 get accountNumber {
    return account.baseAccount.accountNumber;
  }

  @override
  Int64 get sequence {
    return account.baseAccount.sequence;
  }

  EthAccount(acc.EthAccount account) : account = account;

  static EthAccount fromAny(Any any) {
    final account = acc.EthAccount.fromBuffer(any.value);
    return EthAccount(account);
  }

  @override
  String get ethAddress {
    return bech32ToHexAddress(address);
  }

  @override
  String get codeHash {
    return account.codeHash;
  }

  @override
  int get type {
    if (emptyCodeHash == codeHash) {
      return AccountTypeEOA;
    }
    return AccountTypeContract;
  }

  @override
  set setCodeHash(String codeHash) {
    account.codeHash = codeHash;
  }
}
