// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GRPCInfo _$GRPCInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['host'],
  );
  return GRPCInfo(
    host: json['host'] as String,
    port: json['port'] as int? ?? 9090,
  );
}

Map<String, dynamic> _$GRPCInfoToJson(GRPCInfo instance) => <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
    };

NetworkInfo _$NetworkInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['bech32_hrp'],
  );
  return NetworkInfo(
    bech32Hrp: json['bech32_hrp'] as String,
    grpcInfo: GRPCInfo.fromJson(json['grpcInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkInfoToJson(NetworkInfo instance) =>
    <String, dynamic>{
      'bech32_hrp': instance.bech32Hrp,
      'grpcInfo': instance.grpcInfo.toJson(),
    };
