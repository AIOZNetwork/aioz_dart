import 'package:aioz/aioz.dart';
import 'package:test/test.dart';

void main() {
  test('NetworkInfo toJson and fromJson', () {
    final info = NetworkInfo.fromSingleHost(
      bech32Hrp: 'test',
      host: 'test.example.com',
    );
    final json = info.toJson();
    final fromJson = NetworkInfo.fromJson(json);
    expect(fromJson, equals(info));
  });
}
