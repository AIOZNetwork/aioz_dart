import 'package:aioz/aioz.dart';
import 'package:aioz/proto/cosmos/bank/v1beta1/export.dart' as bank;

void main() async {
  // Create a wallet
  final networkInfo = NetworkInfo.fromSingleHost(
    bech32Hrp: 'aioz',
    host: '10.0.0.77',
    grpcPort: 19090,
    httpPort: 11317,
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
  final wallet = Wallet.derive(mnemonic, networkInfo);

  print('Wallet Address: ${wallet.hexEip55Address}');

  // 3. Create and sign the transaction
  final message = bank.MsgSend.create()
    ..fromAddress = wallet.hexAddress
    ..toAddress = '0xC5A1da5EC93c0f09F82048A9E820215B537EE433';
  message.amount.add(Coin.create()
    ..denom = 'atoz'
    ..amount = '1000000000');

  final signer = TxSigner.fromNetworkInfo(networkInfo);
  final tx = await signer.createAndSign(wallet, [message]);

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
