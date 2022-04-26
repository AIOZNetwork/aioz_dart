///
//  Generated code. Do not modify.
//  source: aioz/aiozrc20/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../cosmos/base/query/v1beta1/pagination.pb.dart' as $4;
import 'aiozrc20.pb.dart' as $3;
import 'genesis.pb.dart' as $5;

class QueryTokenPairsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTokenPairsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.aiozrc20.v1'), createEmptyInstance: create)
    ..aOM<$4.PageRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $4.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryTokenPairsRequest._() : super();
  factory QueryTokenPairsRequest({
    $4.PageRequest? pagination,
  }) {
    final _result = create();
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryTokenPairsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTokenPairsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTokenPairsRequest clone() => QueryTokenPairsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTokenPairsRequest copyWith(void Function(QueryTokenPairsRequest) updates) => super.copyWith((message) => updates(message as QueryTokenPairsRequest)) as QueryTokenPairsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTokenPairsRequest create() => QueryTokenPairsRequest._();
  QueryTokenPairsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryTokenPairsRequest> createRepeated() => $pb.PbList<QueryTokenPairsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryTokenPairsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTokenPairsRequest>(create);
  static QueryTokenPairsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $4.PageRequest get pagination => $_getN(0);
  @$pb.TagNumber(1)
  set pagination($4.PageRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPagination() => $_has(0);
  @$pb.TagNumber(1)
  void clearPagination() => clearField(1);
  @$pb.TagNumber(1)
  $4.PageRequest ensurePagination() => $_ensure(0);
}

class QueryTokenPairsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTokenPairsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.aiozrc20.v1'), createEmptyInstance: create)
    ..pc<$3.TokenPair>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenPairs', $pb.PbFieldType.PM, subBuilder: $3.TokenPair.create)
    ..aOM<$4.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $4.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryTokenPairsResponse._() : super();
  factory QueryTokenPairsResponse({
    $core.Iterable<$3.TokenPair>? tokenPairs,
    $4.PageResponse? pagination,
  }) {
    final _result = create();
    if (tokenPairs != null) {
      _result.tokenPairs.addAll(tokenPairs);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryTokenPairsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTokenPairsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTokenPairsResponse clone() => QueryTokenPairsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTokenPairsResponse copyWith(void Function(QueryTokenPairsResponse) updates) => super.copyWith((message) => updates(message as QueryTokenPairsResponse)) as QueryTokenPairsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTokenPairsResponse create() => QueryTokenPairsResponse._();
  QueryTokenPairsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryTokenPairsResponse> createRepeated() => $pb.PbList<QueryTokenPairsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryTokenPairsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTokenPairsResponse>(create);
  static QueryTokenPairsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.TokenPair> get tokenPairs => $_getList(0);

  @$pb.TagNumber(2)
  $4.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($4.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $4.PageResponse ensurePagination() => $_ensure(1);
}

class QueryTokenPairRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTokenPairRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.aiozrc20.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  QueryTokenPairRequest._() : super();
  factory QueryTokenPairRequest({
    $core.String? token,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory QueryTokenPairRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTokenPairRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTokenPairRequest clone() => QueryTokenPairRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTokenPairRequest copyWith(void Function(QueryTokenPairRequest) updates) => super.copyWith((message) => updates(message as QueryTokenPairRequest)) as QueryTokenPairRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTokenPairRequest create() => QueryTokenPairRequest._();
  QueryTokenPairRequest createEmptyInstance() => create();
  static $pb.PbList<QueryTokenPairRequest> createRepeated() => $pb.PbList<QueryTokenPairRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryTokenPairRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTokenPairRequest>(create);
  static QueryTokenPairRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
}

class QueryTokenPairResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTokenPairResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.aiozrc20.v1'), createEmptyInstance: create)
    ..aOM<$3.TokenPair>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenPair', subBuilder: $3.TokenPair.create)
    ..hasRequiredFields = false
  ;

  QueryTokenPairResponse._() : super();
  factory QueryTokenPairResponse({
    $3.TokenPair? tokenPair,
  }) {
    final _result = create();
    if (tokenPair != null) {
      _result.tokenPair = tokenPair;
    }
    return _result;
  }
  factory QueryTokenPairResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTokenPairResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTokenPairResponse clone() => QueryTokenPairResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTokenPairResponse copyWith(void Function(QueryTokenPairResponse) updates) => super.copyWith((message) => updates(message as QueryTokenPairResponse)) as QueryTokenPairResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTokenPairResponse create() => QueryTokenPairResponse._();
  QueryTokenPairResponse createEmptyInstance() => create();
  static $pb.PbList<QueryTokenPairResponse> createRepeated() => $pb.PbList<QueryTokenPairResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryTokenPairResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTokenPairResponse>(create);
  static QueryTokenPairResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.TokenPair get tokenPair => $_getN(0);
  @$pb.TagNumber(1)
  set tokenPair($3.TokenPair v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTokenPair() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokenPair() => clearField(1);
  @$pb.TagNumber(1)
  $3.TokenPair ensureTokenPair() => $_ensure(0);
}

class QueryParamsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.aiozrc20.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryParamsRequest._() : super();
  factory QueryParamsRequest() => create();
  factory QueryParamsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsRequest clone() => QueryParamsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsRequest copyWith(void Function(QueryParamsRequest) updates) => super.copyWith((message) => updates(message as QueryParamsRequest)) as QueryParamsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest create() => QueryParamsRequest._();
  QueryParamsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryParamsRequest> createRepeated() => $pb.PbList<QueryParamsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsRequest>(create);
  static QueryParamsRequest? _defaultInstance;
}

class QueryParamsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.aiozrc20.v1'), createEmptyInstance: create)
    ..aOM<$5.Params>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'params', subBuilder: $5.Params.create)
    ..hasRequiredFields = false
  ;

  QueryParamsResponse._() : super();
  factory QueryParamsResponse({
    $5.Params? params,
  }) {
    final _result = create();
    if (params != null) {
      _result.params = params;
    }
    return _result;
  }
  factory QueryParamsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsResponse clone() => QueryParamsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsResponse copyWith(void Function(QueryParamsResponse) updates) => super.copyWith((message) => updates(message as QueryParamsResponse)) as QueryParamsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse create() => QueryParamsResponse._();
  QueryParamsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryParamsResponse> createRepeated() => $pb.PbList<QueryParamsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsResponse>(create);
  static QueryParamsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $5.Params get params => $_getN(0);
  @$pb.TagNumber(1)
  set params($5.Params v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => clearField(1);
  @$pb.TagNumber(1)
  $5.Params ensureParams() => $_ensure(0);
}

