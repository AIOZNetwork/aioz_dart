import 'package:aioz/aioz.dart';
import 'package:aioz/proto/cosmos/base/tendermint/v1beta1/export.dart' as tm;
import 'package:aioz/proto/tendermint/p2p/export.dart' as p2p;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../common.dart';
import 'service_test.mocks.dart';

@GenerateMocks([tm.ServiceClient])
void main() {
  late tm.ServiceClient client;
  late TendermintService service;

  setUp(() {
    client = MockServiceClient();
    service = TendermintService(client: client);
  });

  group('getNodeInfo', () {
    test('returns correct node info when everything is valid', () async {
      final req = tm.GetNodeInfoRequest();
      when(client.getNodeInfo(req)).thenAnswer((call) {
        final response = tm.GetNodeInfoResponse.create()
          ..defaultNodeInfo = p2p.DefaultNodeInfo(network: 'testchain');

        return MockResponseFuture.value(response);
      });

      final nodeInfo = await service.getNodeInfo();
      expect(nodeInfo.network, 'testchain');
    });
  });
}
