import 'package:aioz/aioz.dart';
import 'package:aioz/proto/cosmos/bank/v1beta1/export.dart' as bank;
import 'package:aioz/proto/ibc/applications/transfer/v1/export.dart'
    as ibc_transfer;
import 'package:aioz/proto/ibc/core/client/v1/export.dart' as ibc_client;
import 'package:fixnum/fixnum.dart';

void main() async {
  // Create a wallet
  final networkInfo = NetworkInfo.fromSingleHost(
    bech32Hrp: 'aioz',
    host: 'https://grpc-ds.testnet.aioz.network',
    httpHost: 'https://lcd-ds.testnet.aioz.network',
    grpcPort: 443,
    httpPort: 443,
  );

  final mnemonic = [
    'scout',
    'ecology',
    'distance',
    'buyer',
    'female',
    'move',
    'nut',
    'trial',
    'lonely',
    'deputy',
    'video',
    'much',
    'rich',
    'basket',
    'another',
    'minor',
    'wasp',
    'token',
    'silent',
    'kingdom',
    'theme',
    'grow',
    'summer',
    'engage',
  ];
  final wallet = HdWallet.fromMnemonic(
    mnemonic.join(' '),
    prefix: networkInfo.bech32Hrp,
  );

  // final serialization =
  //     '{"type":"ethsecp256k1wallet-v1","kdf":{"algorithm":"argon2id","params":{"outputLength":32,"opsLimit":24,"memLimitKib":12288}},"encryption":{"algorithm":"xchacha20poly1305-ietf"},"data":"rP4Id3ck1HgGUvLiokt4OWzsXVPVdBYCtDpLCA/5Bq+3OdbDJ9BgA/v+SH6D4ybdwnizSQMsVJCDKMKbxErbHh6YkMsSLygBRVg1PEhs3QO07ZoNxARWiWIgNajLRwy6f2u1LOC9mBO4zMZSutvoC4wN0AfWB1Yebq+DrOB2yBBHAvEm2FM="}';
  // final wallet = Wallet.deserialize(serialization, '123123123');

  // final sk = Uint8List.fromList(HEX.decode(
  //     '7310375b3f76318612266b58cf2397abcc127d1471156f0592e2cebef2140ce5'));
  // final wallet = Wallet.fromKey(sk, prefix: 'aioz');
  // print(wallet.serialize('123qweASD!@#'));

  print('Wallet Address: ${wallet.accounts[0].hexAddress}');

  // 3. Create and sign the transaction
  // final message = bank.MsgSend.create()
  //   ..fromAddress = wallet.accounts[0].bech32Address
  //   ..toAddress = hexToBech32Address(
  //       networkInfo.bech32Hrp, '0x70207819eC28FB8cc692A4327C80282006E6476A')
  //   ..amount.add(Coin.create()
  //     ..amount = '1000000000000000000'
  //     ..denom = 'attoaioz');

  final message = ibc_transfer.MsgTransfer.create()
    ..sender = wallet.accounts[0].bech32Address
    ..receiver = 'cosmos1davg4s96ulrya44njxgzdstlyau69fuvlyn2x4'
    ..token = (Coin.create()
      ..amount = '1000000000000000000'
      ..denom = 'attoaioz')
    ..sourcePort = 'transfer'
    ..sourceChannel = 'channel-8'
    ..timeoutHeight = ibc_client.Height.create()
    ..timeoutTimestamp =
        Int64(DateTime.now().microsecondsSinceEpoch * 1000 + 5000000000000);


  final fee = Fee()
    ..gasLimit = 200000.toInt64()
    ..amount.add(Coin.create()
      ..amount = '200000000000000'
      ..denom = 'attoaioz');

  final signer = TxSigner.fromNetworkInfo(networkInfo);
  final tx = await signer.createAndSign(
      wallet, wallet.accounts[0].bech32Address, [message],
      fee: fee);

  // 4. Broadcast the transaction
  final txSender = TxSender.fromNetworkInfo(networkInfo);
  final response =
      await txSender.broadcastTx(tx, mode: BroadcastMode.BROADCAST_MODE_BLOCK);

  // Check the result
  if (response.isSuccessful) {
    print('Tx sent successfully. Response: ${response}');
  } else {
    print('Tx errored: ${response}');
  }
}
