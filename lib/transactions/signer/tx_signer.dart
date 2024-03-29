import 'dart:typed_data';

import 'package:aioz/aioz.dart';
import 'package:aioz/proto/cosmos/crypto/secp256k1/export.dart' as secp256;
import 'package:aioz/proto/ethermint/crypto/v1/ethsecp256k1/export.dart'
    as ethsecp256;
import 'package:grpc/grpc.dart' as grpc;
import 'package:protobuf/protobuf.dart';

/// Allows to create and sign a [Tx] object so that it can later
/// be sent to the chain.
class TxSigner {
  final AuthQuerier _authQuerier;
  final TendermintService _tmService;

  TxSigner({
    required AuthQuerier authQuerier,
    required TendermintService tmService,
  })  : _authQuerier = authQuerier,
        _tmService = tmService;

  /// Builds a new [TxSigner] from a given gRPC client channel and HTTP client.
  factory TxSigner.build(grpc.ClientChannel clientChannel) {
    return TxSigner(
      authQuerier: AuthQuerier.build(clientChannel),
      tmService: TendermintService.build(clientChannel),
    );
  }

  /// Builds a new [TxSigner] from the given [NetworkInfo].
  factory TxSigner.fromNetworkInfo(NetworkInfo info) {
    return TxSigner.build(info.gRPCChannel);
  }

  /// Creates a new [Tx] object containing the given [msgs] and signs it using
  /// the provided [wallet].
  /// Optional [TxConfig], memo, gas and fees can be supplied as well.
  Future<Tx> createAndSign(
    IWallet wallet,
    String signerAddress,
    List<GeneratedMessage> msgs, {
    TxConfig? config,
    String? memo,
    Fee? fee,
  }) async {
    // Set the config to the default value if not given
    config ??= DefaultTxConfig.create();
    final signMode = config.defaultSignMode();

    // Set the default fees
    fee ??= Fee()..gasLimit = 200000.toInt64();
    if (!fee.hasGasLimit()) {
      throw Exception('Invalid fees: invalid gas amount specified');
    }

    // Get the account data and node info from the network
    final account = await _authQuerier.getAccountData(signerAddress);
    if (account == null) {
      throw Exception(
        'Account $signerAddress does not exist on chain',
      );
    }

    // Get the node info data
    final nodeInfo = await _tmService.getNodeInfo();

    // Get the public key from the account, or generate it if the
    // chain does not have it yet
    var pubKey = account.pubKey;
    if (pubKey.value.isNotEmpty != true) {
      switch (wallet.algo) {
        case 'secp256k1':
          {
            final secp256Key = secp256.PubKey.create()
              ..key = wallet.publicKey(signerAddress);
            pubKey = Codec.serialize(secp256Key);
          }
          break;
        case 'eth_secp256k1':
          {
            final ethsecp256Key = ethsecp256.PubKey.create()
              ..key = wallet.publicKey(signerAddress);
            pubKey = Codec.serialize(ethsecp256Key);
          }
          break;
      }
    }

    // For SIGN_MODE_DIRECT, calling SetSignatures calls setSignerInfos on
    // TxBuilder under the hood, and SignerInfos is needed to generated the
    // sign bytes. This is the reason for setting SetSignatures here, with a
    // nil signature.
    //
    // Note: this line is not needed for SIGN_MODE_LEGACY_AMINO, but putting it
    // also doesn't affect its generated sign bytes, so for code's simplicity
    // sake, we put it here.
    var sigData = SingleSignatureData(signMode: signMode, signature: null);

    // Set SignatureV2 with empty signatures, to set correct signer infos.
    var sig = SignatureV2(
      pubKey: pubKey,
      data: sigData,
      sequence: account.sequence,
    );

    // Create the transaction builder
    final tx = config.newTxBuilder()
      ..setMsgs(msgs)
      ..setSignatures([sig])
      ..setMemo(memo)
      ..setFeeAmount(fee.amount)
      ..setGasLimit(fee.gasLimit);

    // Generate the bytes to be signed.
    final handler = config.signModeHandler();
    final signerData = SignerData(
      chainId: nodeInfo.network,
      accountNumber: account.accountNumber,
      sequence: account.sequence,
    );
    final bytesToSign = handler.getSignBytes(signMode, signerData, tx.getTx());

    // Sign those bytes
    final sigBytes =
        wallet.sign(signerAddress, Uint8List.fromList(bytesToSign));

    // Construct the SignatureV2 struct
    sigData = SingleSignatureData(signMode: signMode, signature: sigBytes);
    sig = SignatureV2(
      pubKey: pubKey,
      data: sigData,
      sequence: account.sequence,
    );
    tx.setSignatures([sig]);

    // Return the signed transaction
    return tx.getTx();
  }
}
