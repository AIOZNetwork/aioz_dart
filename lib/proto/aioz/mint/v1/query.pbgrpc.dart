///
//  Generated code. Do not modify.
//  source: aioz/mint/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $0;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$params =
      $grpc.ClientMethod<$0.QueryParamsRequest, $0.QueryParamsResponse>(
          '/aioz.mint.v1.Query/Params',
          ($0.QueryParamsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryParamsResponse.fromBuffer(value));
  static final _$inflation =
      $grpc.ClientMethod<$0.QueryInflationRequest, $0.QueryInflationResponse>(
          '/aioz.mint.v1.Query/Inflation',
          ($0.QueryInflationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryInflationResponse.fromBuffer(value));
  static final _$annualInflation = $grpc.ClientMethod<
          $0.QueryAnnualInflationRequest, $0.QueryAnnualInflationResponse>(
      '/aioz.mint.v1.Query/AnnualInflation',
      ($0.QueryAnnualInflationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryAnnualInflationResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QueryParamsResponse> params(
      $0.QueryParamsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$params, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryInflationResponse> inflation(
      $0.QueryInflationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$inflation, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryAnnualInflationResponse> annualInflation(
      $0.QueryAnnualInflationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$annualInflation, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'aioz.mint.v1.Query';

  QueryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.QueryParamsRequest, $0.QueryParamsResponse>(
            'Params',
            params_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryParamsRequest.fromBuffer(value),
            ($0.QueryParamsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryInflationRequest,
            $0.QueryInflationResponse>(
        'Inflation',
        inflation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryInflationRequest.fromBuffer(value),
        ($0.QueryInflationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryAnnualInflationRequest,
            $0.QueryAnnualInflationResponse>(
        'AnnualInflation',
        annualInflation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryAnnualInflationRequest.fromBuffer(value),
        ($0.QueryAnnualInflationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.QueryParamsResponse> params_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryParamsRequest> request) async {
    return params(call, await request);
  }

  $async.Future<$0.QueryInflationResponse> inflation_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryInflationRequest> request) async {
    return inflation(call, await request);
  }

  $async.Future<$0.QueryAnnualInflationResponse> annualInflation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryAnnualInflationRequest> request) async {
    return annualInflation(call, await request);
  }

  $async.Future<$0.QueryParamsResponse> params(
      $grpc.ServiceCall call, $0.QueryParamsRequest request);
  $async.Future<$0.QueryInflationResponse> inflation(
      $grpc.ServiceCall call, $0.QueryInflationRequest request);
  $async.Future<$0.QueryAnnualInflationResponse> annualInflation(
      $grpc.ServiceCall call, $0.QueryAnnualInflationRequest request);
}
