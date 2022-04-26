///
//  Generated code. Do not modify.
//  source: aioz/aiozrc20/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $0;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$tokenPairs =
      $grpc.ClientMethod<$0.QueryTokenPairsRequest, $0.QueryTokenPairsResponse>(
          '/aioz.aiozrc20.v1.Query/TokenPairs',
          ($0.QueryTokenPairsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryTokenPairsResponse.fromBuffer(value));
  static final _$tokenPair =
      $grpc.ClientMethod<$0.QueryTokenPairRequest, $0.QueryTokenPairResponse>(
          '/aioz.aiozrc20.v1.Query/TokenPair',
          ($0.QueryTokenPairRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryTokenPairResponse.fromBuffer(value));
  static final _$params =
      $grpc.ClientMethod<$0.QueryParamsRequest, $0.QueryParamsResponse>(
          '/aioz.aiozrc20.v1.Query/Params',
          ($0.QueryParamsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryParamsResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QueryTokenPairsResponse> tokenPairs(
      $0.QueryTokenPairsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$tokenPairs, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryTokenPairResponse> tokenPair(
      $0.QueryTokenPairRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$tokenPair, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryParamsResponse> params(
      $0.QueryParamsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$params, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'aioz.aiozrc20.v1.Query';

  QueryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.QueryTokenPairsRequest,
            $0.QueryTokenPairsResponse>(
        'TokenPairs',
        tokenPairs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryTokenPairsRequest.fromBuffer(value),
        ($0.QueryTokenPairsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryTokenPairRequest,
            $0.QueryTokenPairResponse>(
        'TokenPair',
        tokenPair_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryTokenPairRequest.fromBuffer(value),
        ($0.QueryTokenPairResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.QueryParamsRequest, $0.QueryParamsResponse>(
            'Params',
            params_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryParamsRequest.fromBuffer(value),
            ($0.QueryParamsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.QueryTokenPairsResponse> tokenPairs_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryTokenPairsRequest> request) async {
    return tokenPairs(call, await request);
  }

  $async.Future<$0.QueryTokenPairResponse> tokenPair_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryTokenPairRequest> request) async {
    return tokenPair(call, await request);
  }

  $async.Future<$0.QueryParamsResponse> params_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryParamsRequest> request) async {
    return params(call, await request);
  }

  $async.Future<$0.QueryTokenPairsResponse> tokenPairs(
      $grpc.ServiceCall call, $0.QueryTokenPairsRequest request);
  $async.Future<$0.QueryTokenPairResponse> tokenPair(
      $grpc.ServiceCall call, $0.QueryTokenPairRequest request);
  $async.Future<$0.QueryParamsResponse> params(
      $grpc.ServiceCall call, $0.QueryParamsRequest request);
}
