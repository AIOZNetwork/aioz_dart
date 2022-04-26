///
//  Generated code. Do not modify.
//  source: aioz/aiozrc20/v1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tx.pb.dart' as $1;
export 'tx.pb.dart';

class MsgClient extends $grpc.Client {
  static final _$convertCoin =
      $grpc.ClientMethod<$1.MsgConvertCoin, $1.MsgConvertCoinResponse>(
          '/aioz.aiozrc20.v1.Msg/ConvertCoin',
          ($1.MsgConvertCoin value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.MsgConvertCoinResponse.fromBuffer(value));
  static final _$convertAIOZRC20 =
      $grpc.ClientMethod<$1.MsgConvertAIOZRC20, $1.MsgConvertAIOZRC20Response>(
          '/aioz.aiozrc20.v1.Msg/ConvertAIOZRC20',
          ($1.MsgConvertAIOZRC20 value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.MsgConvertAIOZRC20Response.fromBuffer(value));

  MsgClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.MsgConvertCoinResponse> convertCoin(
      $1.MsgConvertCoin request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$convertCoin, request, options: options);
  }

  $grpc.ResponseFuture<$1.MsgConvertAIOZRC20Response> convertAIOZRC20(
      $1.MsgConvertAIOZRC20 request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$convertAIOZRC20, request, options: options);
  }
}

abstract class MsgServiceBase extends $grpc.Service {
  $core.String get $name => 'aioz.aiozrc20.v1.Msg';

  MsgServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$1.MsgConvertCoin, $1.MsgConvertCoinResponse>(
            'ConvertCoin',
            convertCoin_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.MsgConvertCoin.fromBuffer(value),
            ($1.MsgConvertCoinResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.MsgConvertAIOZRC20,
            $1.MsgConvertAIOZRC20Response>(
        'ConvertAIOZRC20',
        convertAIOZRC20_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.MsgConvertAIOZRC20.fromBuffer(value),
        ($1.MsgConvertAIOZRC20Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.MsgConvertCoinResponse> convertCoin_Pre(
      $grpc.ServiceCall call, $async.Future<$1.MsgConvertCoin> request) async {
    return convertCoin(call, await request);
  }

  $async.Future<$1.MsgConvertAIOZRC20Response> convertAIOZRC20_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.MsgConvertAIOZRC20> request) async {
    return convertAIOZRC20(call, await request);
  }

  $async.Future<$1.MsgConvertCoinResponse> convertCoin(
      $grpc.ServiceCall call, $1.MsgConvertCoin request);
  $async.Future<$1.MsgConvertAIOZRC20Response> convertAIOZRC20(
      $grpc.ServiceCall call, $1.MsgConvertAIOZRC20 request);
}
