///
//  Generated code. Do not modify.
//  source: aioz/staking/v1beta1/proposal.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../cosmos/staking/v1beta1/tx.pb.dart' as $2;

class CreateValidatorProposal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateValidatorProposal', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'aioz.staking.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$2.MsgCreateValidator>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validator', subBuilder: $2.MsgCreateValidator.create)
    ..hasRequiredFields = false
  ;

  CreateValidatorProposal._() : super();
  factory CreateValidatorProposal({
    $core.String? title,
    $core.String? description,
    $2.MsgCreateValidator? validator,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (validator != null) {
      _result.validator = validator;
    }
    return _result;
  }
  factory CreateValidatorProposal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateValidatorProposal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateValidatorProposal clone() => CreateValidatorProposal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateValidatorProposal copyWith(void Function(CreateValidatorProposal) updates) => super.copyWith((message) => updates(message as CreateValidatorProposal)) as CreateValidatorProposal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateValidatorProposal create() => CreateValidatorProposal._();
  CreateValidatorProposal createEmptyInstance() => create();
  static $pb.PbList<CreateValidatorProposal> createRepeated() => $pb.PbList<CreateValidatorProposal>();
  @$core.pragma('dart2js:noInline')
  static CreateValidatorProposal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateValidatorProposal>(create);
  static CreateValidatorProposal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $2.MsgCreateValidator get validator => $_getN(2);
  @$pb.TagNumber(3)
  set validator($2.MsgCreateValidator v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasValidator() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidator() => clearField(3);
  @$pb.TagNumber(3)
  $2.MsgCreateValidator ensureValidator() => $_ensure(2);
}

