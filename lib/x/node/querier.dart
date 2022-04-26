import 'package:aioz/aioz.dart';
import 'package:http/http.dart' as http;

/// Allows to query a full node for its information.
class NodeQuerier extends QueryHelper {
  final String _lcdEndpoint;

  NodeQuerier._({
    required http.Client httpClient,
    required String lcdEndpoint,
  })   : _lcdEndpoint = lcdEndpoint,
        super(httpClient: httpClient);

  factory NodeQuerier.build(http.Client httpClient, String lcdEndpoint) {
    return NodeQuerier._(httpClient: httpClient, lcdEndpoint: lcdEndpoint);
  }

  /// Queries the node info of the chain.
  Future<NodeInfo> getNodeInfo() async {
    final result = await queryChain('$_lcdEndpoint/node_info');
    if (!result.isSuccessful) {
      throw Exception(result.error);
    }

    final value = result.value as Map<String, dynamic>;
    return NodeInfoResponse.fromJson(value).nodeInfo;
  }
}
