///
//  Generated code. Do not modify.
//  source: aioz/staking/v1beta1/staking.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/duration.pb.dart' as $3;

class Params extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Params', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.staking.v1beta1'), createEmptyInstance: create)
    ..aOM<$3.Duration>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unbondingTime', subBuilder: $3.Duration.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxValidators', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxEntries', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'historicalEntries', $pb.PbFieldType.OU3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bondDenom')
    ..aOB(101, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptAllValidators')
    ..hasRequiredFields = false
  ;

  Params._() : super();
  factory Params({
    $3.Duration? unbondingTime,
    $core.int? maxValidators,
    $core.int? maxEntries,
    $core.int? historicalEntries,
    $core.String? bondDenom,
    $core.bool? acceptAllValidators,
  }) {
    final _result = create();
    if (unbondingTime != null) {
      _result.unbondingTime = unbondingTime;
    }
    if (maxValidators != null) {
      _result.maxValidators = maxValidators;
    }
    if (maxEntries != null) {
      _result.maxEntries = maxEntries;
    }
    if (historicalEntries != null) {
      _result.historicalEntries = historicalEntries;
    }
    if (bondDenom != null) {
      _result.bondDenom = bondDenom;
    }
    if (acceptAllValidators != null) {
      _result.acceptAllValidators = acceptAllValidators;
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
  $3.Duration get unbondingTime => $_getN(0);
  @$pb.TagNumber(1)
  set unbondingTime($3.Duration v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnbondingTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnbondingTime() => clearField(1);
  @$pb.TagNumber(1)
  $3.Duration ensureUnbondingTime() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get maxValidators => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxValidators($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxValidators() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxValidators() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxEntries => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxEntries($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxEntries() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxEntries() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get historicalEntries => $_getIZ(3);
  @$pb.TagNumber(4)
  set historicalEntries($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHistoricalEntries() => $_has(3);
  @$pb.TagNumber(4)
  void clearHistoricalEntries() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get bondDenom => $_getSZ(4);
  @$pb.TagNumber(5)
  set bondDenom($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBondDenom() => $_has(4);
  @$pb.TagNumber(5)
  void clearBondDenom() => clearField(5);

  @$pb.TagNumber(101)
  $core.bool get acceptAllValidators => $_getBF(5);
  @$pb.TagNumber(101)
  set acceptAllValidators($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(101)
  $core.bool hasAcceptAllValidators() => $_has(5);
  @$pb.TagNumber(101)
  void clearAcceptAllValidators() => clearField(101);
}

