///
//  Generated code. Do not modify.
//  source: aioz/aiozrc20/v1/aiozrc20.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use ownerDescriptor instead')
const Owner$json = const {
  '1': 'Owner',
  '2': const [
    const {'1': 'OWNER_UNSPECIFIED', '2': 0},
    const {'1': 'OWNER_MODULE', '2': 1},
    const {'1': 'OWNER_EXTERNAL', '2': 2},
  ],
  '3': const {},
};

/// Descriptor for `Owner`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ownerDescriptor = $convert.base64Decode('CgVPd25lchIVChFPV05FUl9VTlNQRUNJRklFRBAAEhAKDE9XTkVSX01PRFVMRRABEhIKDk9XTkVSX0VYVEVSTkFMEAIaBIijHgA=');
@$core.Deprecated('Use tokenPairDescriptor instead')
const TokenPair$json = const {
  '1': 'TokenPair',
  '2': const [
    const {'1': 'aiozrc20_address', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'aiozrc20Address'},
    const {'1': 'denom', '3': 2, '4': 1, '5': 9, '10': 'denom'},
    const {'1': 'enabled', '3': 3, '4': 1, '5': 8, '10': 'enabled'},
    const {'1': 'contract_owner', '3': 4, '4': 1, '5': 14, '6': '.aioz.aiozrc20.v1.Owner', '10': 'contractOwner'},
  ],
  '7': const {},
};

/// Descriptor for `TokenPair`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenPairDescriptor = $convert.base64Decode('CglUb2tlblBhaXISPgoQYWlvenJjMjBfYWRkcmVzcxgBIAEoCUIT4t4fD0FJT1pSQzIwQWRkcmVzc1IPYWlvenJjMjBBZGRyZXNzEhQKBWRlbm9tGAIgASgJUgVkZW5vbRIYCgdlbmFibGVkGAMgASgIUgdlbmFibGVkEj4KDmNvbnRyYWN0X293bmVyGAQgASgOMhcuYWlvei5haW96cmMyMC52MS5Pd25lclINY29udHJhY3RPd25lcjoE6KAfAQ==');
@$core.Deprecated('Use registerCoinProposalDescriptor instead')
const RegisterCoinProposal$json = const {
  '1': 'RegisterCoinProposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'metadata', '3': 3, '4': 1, '5': 11, '6': '.cosmos.bank.v1beta1.Metadata', '8': const {}, '10': 'metadata'},
  ],
  '7': const {},
};

/// Descriptor for `RegisterCoinProposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerCoinProposalDescriptor = $convert.base64Decode('ChRSZWdpc3RlckNvaW5Qcm9wb3NhbBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9uEj8KCG1ldGFkYXRhGAMgASgLMh0uY29zbW9zLmJhbmsudjFiZXRhMS5NZXRhZGF0YUIEyN4fAFIIbWV0YWRhdGE6BOigHwA=');
@$core.Deprecated('Use registerAIOZRC20ProposalDescriptor instead')
const RegisterAIOZRC20Proposal$json = const {
  '1': 'RegisterAIOZRC20Proposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'aiozrc20_address', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'aiozrc20Address'},
  ],
  '7': const {},
};

/// Descriptor for `RegisterAIOZRC20Proposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerAIOZRC20ProposalDescriptor = $convert.base64Decode('ChhSZWdpc3RlckFJT1pSQzIwUHJvcG9zYWwSFAoFdGl0bGUYASABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhI+ChBhaW96cmMyMF9hZGRyZXNzGAMgASgJQhPi3h8PQUlPWlJDMjBBZGRyZXNzUg9haW96cmMyMEFkZHJlc3M6BOigHwA=');
@$core.Deprecated('Use toggleTokenPairConversionProposalDescriptor instead')
const ToggleTokenPairConversionProposal$json = const {
  '1': 'ToggleTokenPairConversionProposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
  ],
  '7': const {},
};

/// Descriptor for `ToggleTokenPairConversionProposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toggleTokenPairConversionProposalDescriptor = $convert.base64Decode('CiFUb2dnbGVUb2tlblBhaXJDb252ZXJzaW9uUHJvcG9zYWwSFAoFdGl0bGUYASABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhIUCgV0b2tlbhgDIAEoCVIFdG9rZW46BOigHwE=');
@$core.Deprecated('Use updateTokenPairProposalDescriptor instead')
const UpdateTokenPairProposal$json = const {
  '1': 'UpdateTokenPairProposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'aiozrc20_address', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'aiozrc20Address'},
    const {'1': 'new_aiozrc20_address', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'newAiozrc20Address'},
  ],
  '7': const {},
};

/// Descriptor for `UpdateTokenPairProposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTokenPairProposalDescriptor = $convert.base64Decode('ChdVcGRhdGVUb2tlblBhaXJQcm9wb3NhbBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9uEj4KEGFpb3pyYzIwX2FkZHJlc3MYAyABKAlCE+LeHw9BSU9aUkMyMEFkZHJlc3NSD2Fpb3pyYzIwQWRkcmVzcxJIChRuZXdfYWlvenJjMjBfYWRkcmVzcxgEIAEoCUIW4t4fEk5ld0FJT1pSQzIwQWRkcmVzc1ISbmV3QWlvenJjMjBBZGRyZXNzOgTooB8B');
