///
//  Generated code. Do not modify.
//  source: aioz/bonus/v1/params.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Params extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Params', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.bonus.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bonusDenom')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bonusAmount')
    ..hasRequiredFields = false
  ;

  Params._() : super();
  factory Params({
    $core.String? bonusDenom,
    $core.String? bonusAmount,
  }) {
    final _result = create();
    if (bonusDenom != null) {
      _result.bonusDenom = bonusDenom;
    }
    if (bonusAmount != null) {
      _result.bonusAmount = bonusAmount;
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
  $core.String get bonusDenom => $_getSZ(0);
  @$pb.TagNumber(1)
  set bonusDenom($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBonusDenom() => $_has(0);
  @$pb.TagNumber(1)
  void clearBonusDenom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bonusAmount => $_getSZ(1);
  @$pb.TagNumber(2)
  set bonusAmount($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBonusAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearBonusAmount() => clearField(2);
}

