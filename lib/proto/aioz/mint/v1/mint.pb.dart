///
//  Generated code. Do not modify.
//  source: aioz/mint/v1/mint.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Params extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Params', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.mint.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mintDenom')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blocksPerYear', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startHeight')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inflation')
    ..hasRequiredFields = false
  ;

  Params._() : super();
  factory Params({
    $core.String? mintDenom,
    $fixnum.Int64? blocksPerYear,
    $fixnum.Int64? startHeight,
    $core.String? inflation,
  }) {
    final _result = create();
    if (mintDenom != null) {
      _result.mintDenom = mintDenom;
    }
    if (blocksPerYear != null) {
      _result.blocksPerYear = blocksPerYear;
    }
    if (startHeight != null) {
      _result.startHeight = startHeight;
    }
    if (inflation != null) {
      _result.inflation = inflation;
    }
    return _result;
  }
  factory Params.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Params.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Params clone() => Params()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Params copyWith(void Function(Params) updates) => super.copyWith((message) => updates(message as Params)) as Params; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Params create() => Params._();
  Params createEmptyInstance() => create();
  static $pb.PbList<Params> createRepeated() => $pb.PbList<Params>();
  @$core.pragma('dart2js:noInline')
  static Params getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Params>(create);
  static Params? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mintDenom => $_getSZ(0);
  @$pb.TagNumber(1)
  set mintDenom($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMintDenom() => $_has(0);
  @$pb.TagNumber(1)
  void clearMintDenom() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get blocksPerYear => $_getI64(1);
  @$pb.TagNumber(2)
  set blocksPerYear($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlocksPerYear() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlocksPerYear() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startHeight => $_getI64(2);
  @$pb.TagNumber(3)
  set startHeight($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get inflation => $_getSZ(3);
  @$pb.TagNumber(4)
  set inflation($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInflation() => $_has(3);
  @$pb.TagNumber(4)
  void clearInflation() => clearField(4);
}

