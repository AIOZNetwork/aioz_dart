///
//  Generated code. Do not modify.
//  source: aioz/staking/v1beta1/genesis.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use genesisStateDescriptor instead')
const GenesisState$json = const {
  '1': 'GenesisState',
  '2': const [
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.aioz.staking.v1beta1.Params', '8': const {}, '10': 'params'},
    const {'1': 'last_total_power', '3': 2, '4': 1, '5': 12, '8': const {}, '10': 'lastTotalPower'},
    const {'1': 'last_validator_powers', '3': 3, '4': 3, '5': 11, '6': '.aioz.staking.v1beta1.LastValidatorPower', '8': const {}, '10': 'lastValidatorPowers'},
    const {'1': 'validators', '3': 4, '4': 3, '5': 11, '6': '.cosmos.staking.v1beta1.Validator', '8': const {}, '10': 'validators'},
    const {'1': 'delegations', '3': 5, '4': 3, '5': 11, '6': '.cosmos.staking.v1beta1.Delegation', '8': const {}, '10': 'delegations'},
    const {'1': 'unbonding_delegations', '3': 6, '4': 3, '5': 11, '6': '.cosmos.staking.v1beta1.UnbondingDelegation', '8': const {}, '10': 'unbondingDelegations'},
    const {'1': 'redelegations', '3': 7, '4': 3, '5': 11, '6': '.cosmos.staking.v1beta1.Redelegation', '8': const {}, '10': 'redelegations'},
    const {'1': 'exported', '3': 8, '4': 1, '5': 8, '10': 'exported'},
  ],
};

/// Descriptor for `GenesisState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genesisStateDescriptor = $convert.base64Decode('CgxHZW5lc2lzU3RhdGUSOgoGcGFyYW1zGAEgASgLMhwuYWlvei5zdGFraW5nLnYxYmV0YTEuUGFyYW1zQgTI3h8AUgZwYXJhbXMScwoQbGFzdF90b3RhbF9wb3dlchgCIAEoDEJJ2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuSW508t4fF3lhbWw6Imxhc3RfdG90YWxfcG93ZXIiyN4fAFIObGFzdFRvdGFsUG93ZXISggEKFWxhc3RfdmFsaWRhdG9yX3Bvd2VycxgDIAMoCzIoLmFpb3ouc3Rha2luZy52MWJldGExLkxhc3RWYWxpZGF0b3JQb3dlckIk8t4fHHlhbWw6Imxhc3RfdmFsaWRhdG9yX3Bvd2VycyLI3h8AUhNsYXN0VmFsaWRhdG9yUG93ZXJzEkcKCnZhbGlkYXRvcnMYBCADKAsyIS5jb3Ntb3Muc3Rha2luZy52MWJldGExLlZhbGlkYXRvckIEyN4fAFIKdmFsaWRhdG9ycxJKCgtkZWxlZ2F0aW9ucxgFIAMoCzIiLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuRGVsZWdhdGlvbkIEyN4fAFILZGVsZWdhdGlvbnMShgEKFXVuYm9uZGluZ19kZWxlZ2F0aW9ucxgGIAMoCzIrLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuVW5ib25kaW5nRGVsZWdhdGlvbkIk8t4fHHlhbWw6InVuYm9uZGluZ19kZWxlZ2F0aW9ucyLI3h8AUhR1bmJvbmRpbmdEZWxlZ2F0aW9ucxJQCg1yZWRlbGVnYXRpb25zGAcgAygLMiQuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5SZWRlbGVnYXRpb25CBMjeHwBSDXJlZGVsZWdhdGlvbnMSGgoIZXhwb3J0ZWQYCCABKAhSCGV4cG9ydGVk');
@$core.Deprecated('Use lastValidatorPowerDescriptor instead')
const LastValidatorPower$json = const {
  '1': 'LastValidatorPower',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'power', '3': 2, '4': 1, '5': 3, '10': 'power'},
  ],
  '7': const {},
};

/// Descriptor for `LastValidatorPower`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastValidatorPowerDescriptor = $convert.base64Decode('ChJMYXN0VmFsaWRhdG9yUG93ZXISGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcxIUCgVwb3dlchgCIAEoA1IFcG93ZXI6COigHwCIoB8A');
