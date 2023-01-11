import 'package:aioz/proto/cosmos/base/tendermint/v1beta1/export.dart' as tm;
import 'package:aioz/proto/tendermint/p2p/export.dart' as p2p;
import 'package:grpc/grpc.dart' as grpc;

class TendermintService {
  final tm.ServiceClient _client;

  TendermintService({required tm.ServiceClient client}) : _client = client;

  /// Builds a new [TendermintService] given a [ClientChannel].
  factory TendermintService.build(grpc.ClientChannel channel) {
    return TendermintService(client: tm.ServiceClient(channel));
  }

  Future<p2p.DefaultNodeInfo> getNodeInfo() async {
    final request = tm.GetNodeInfoRequest.create();
    final response = await _client.getNodeInfo(request);
    return response.defaultNodeInfo;
  }
}
