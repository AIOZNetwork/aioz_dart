import 'package:equatable/equatable.dart';
import 'package:grpc/grpc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_info.g.dart';

const _CHANNEL_CREDENTIAL_SECURE = 'secure';
const _CHANNEL_CREDENTIAL_INSECURE = 'insecure';

Object channelCredentialsToJson(ChannelCredentials credentials) {
  if (credentials.isSecure) {
    return _CHANNEL_CREDENTIAL_SECURE;
  }
  return _CHANNEL_CREDENTIAL_INSECURE;
}

ChannelCredentials channelOptionsFromJson(String value) {
  if (value == _CHANNEL_CREDENTIAL_INSECURE) {
    return ChannelCredentials.insecure();
  }
  return ChannelCredentials.secure();
}

/// Contains the information about the GRPC endpoint
@JsonSerializable(explicitToJson: true)
class GRPCInfo extends Equatable {
  static ClientChannel? _clientChannel;

  @JsonKey(name: 'host', required: true)
  final String host;

  @JsonKey(name: 'port', defaultValue: 9090)
  final int port;

  @JsonKey(
    name: 'channel_credentials',
    fromJson: channelOptionsFromJson,
    toJson: channelCredentialsToJson,
  )
  final ChannelCredentials credentials;

  GRPCInfo({
    required this.host,
    this.port = 9090,
    bool isSecure = true,
  }) : credentials = isSecure
            ? const ChannelCredentials.secure()
            : const ChannelCredentials.insecure();

  /// Creates a new [ClientChannel] using the optional given options.
  ClientChannel getChannel() {
    return _clientChannel ??= ClientChannel(
      host.replaceFirst(RegExp('http(s)?:\/\/'), ''),
      port: port,
      options: ChannelOptions(credentials: credentials),
    );
  }

  factory GRPCInfo.fromJson(Map<String, dynamic> json) {
    return _$GRPCInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GRPCInfoToJson(this);
  }

  @override
  List<Object?> get props {
    return [
      host,
      port,
      credentials.isSecure,
    ];
  }

  @override
  String toString() {
    return 'GRPCInfo {'
        'host: $host, '
        'port: $port '
        '}';
  }
}

/// Contains the information of a generic Cosmos-based network.
@JsonSerializable(explicitToJson: true)
class NetworkInfo extends Equatable {
  /// Bech32 human readable part of the addresses related to this network
  @JsonKey(name: 'bech32_hrp', required: true)
  final String bech32Hrp;

  /// Information about the gRPC endpoint to use
  @JsonKey(name: 'grpcInfo')
  final GRPCInfo grpcInfo;

  NetworkInfo({
    required this.bech32Hrp,
    required this.grpcInfo,
  });

  factory NetworkInfo.fromSingleHost({
    required String bech32Hrp,
    required String host,
    int port = 9090,
  }) {
    return NetworkInfo(
      bech32Hrp: bech32Hrp,
      grpcInfo: GRPCInfo(
        host: host,
        port: port,
        isSecure: host.startsWith('https://'),
      ),
    );
  }

  factory NetworkInfo.fromJson(Map<String, dynamic> json) {
    return _$NetworkInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NetworkInfoToJson(this);
  }

  /// Returns the ClientChannel that should be used to connect
  /// to the gRPC endpoint.
  ClientChannel get gRPCChannel {
    return grpcInfo.getChannel();
  }

  @override
  List<Object> get props {
    return [bech32Hrp, grpcInfo];
  }

  @override
  String toString() {
    return '{ '
        'bech32: $bech32Hrp, '
        'grpcInfo: $grpcInfo '
        '}';
  }
}
