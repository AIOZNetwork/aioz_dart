///
//  Generated code. Do not modify.
//  source: aioz/aiozrc20/v1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use msgConvertCoinDescriptor instead')
const MsgConvertCoin$json = const {
  '1': 'MsgConvertCoin',
  '2': const [
    const {'1': 'coin', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'coin'},
    const {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'sender', '3': 3, '4': 1, '5': 9, '10': 'sender'},
  ],
};

/// Descriptor for `MsgConvertCoin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgConvertCoinDescriptor = $convert.base64Decode('Cg5Nc2dDb252ZXJ0Q29pbhIzCgRjb2luGAEgASgLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luQgTI3h8AUgRjb2luEhoKCHJlY2VpdmVyGAIgASgJUghyZWNlaXZlchIWCgZzZW5kZXIYAyABKAlSBnNlbmRlcg==');
@$core.Deprecated('Use msgConvertCoinResponseDescriptor instead')
const MsgConvertCoinResponse$json = const {
  '1': 'MsgConvertCoinResponse',
};

/// Descriptor for `MsgConvertCoinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgConvertCoinResponseDescriptor = $convert.base64Decode('ChZNc2dDb252ZXJ0Q29pblJlc3BvbnNl');
@$core.Deprecated('Use msgConvertAIOZRC20Descriptor instead')
const MsgConvertAIOZRC20$json = const {
  '1': 'MsgConvertAIOZRC20',
  '2': const [
    const {'1': 'contract_address', '3': 1, '4': 1, '5': 9, '10': 'contractAddress'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'amount'},
    const {'1': 'receiver', '3': 3, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'sender', '3': 4, '4': 1, '5': 9, '10': 'sender'},
  ],
};

/// Descriptor for `MsgConvertAIOZRC20`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgConvertAIOZRC20Descriptor = $convert.base64Decode('ChJNc2dDb252ZXJ0QUlPWlJDMjASKQoQY29udHJhY3RfYWRkcmVzcxgBIAEoCVIPY29udHJhY3RBZGRyZXNzEkYKBmFtb3VudBgCIAEoCUIu2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuSW50yN4fAFIGYW1vdW50EhoKCHJlY2VpdmVyGAMgASgJUghyZWNlaXZlchIWCgZzZW5kZXIYBCABKAlSBnNlbmRlcg==');
@$core.Deprecated('Use msgConvertAIOZRC20ResponseDescriptor instead')
const MsgConvertAIOZRC20Response$json = const {
  '1': 'MsgConvertAIOZRC20Response',
};

/// Descriptor for `MsgConvertAIOZRC20Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgConvertAIOZRC20ResponseDescriptor = $convert.base64Decode('ChpNc2dDb252ZXJ0QUlPWlJDMjBSZXNwb25zZQ==');
