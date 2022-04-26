///
//  Generated code. Do not modify.
//  source: aioz/aiozrc20/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryTokenPairsRequestDescriptor instead')
const QueryTokenPairsRequest$json = const {
  '1': 'QueryTokenPairsRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryTokenPairsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenPairsRequestDescriptor = $convert.base64Decode('ChZRdWVyeVRva2VuUGFpcnNSZXF1ZXN0EkYKCnBhZ2luYXRpb24YASABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryTokenPairsResponseDescriptor instead')
const QueryTokenPairsResponse$json = const {
  '1': 'QueryTokenPairsResponse',
  '2': const [
    const {'1': 'token_pairs', '3': 1, '4': 3, '5': 11, '6': '.aioz.aiozrc20.v1.TokenPair', '8': const {}, '10': 'tokenPairs'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryTokenPairsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenPairsResponseDescriptor = $convert.base64Decode('ChdRdWVyeVRva2VuUGFpcnNSZXNwb25zZRJCCgt0b2tlbl9wYWlycxgBIAMoCzIbLmFpb3ouYWlvenJjMjAudjEuVG9rZW5QYWlyQgTI3h8AUgp0b2tlblBhaXJzEkcKCnBhZ2luYXRpb24YAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryTokenPairRequestDescriptor instead')
const QueryTokenPairRequest$json = const {
  '1': 'QueryTokenPairRequest',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `QueryTokenPairRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenPairRequestDescriptor = $convert.base64Decode('ChVRdWVyeVRva2VuUGFpclJlcXVlc3QSFAoFdG9rZW4YASABKAlSBXRva2Vu');
@$core.Deprecated('Use queryTokenPairResponseDescriptor instead')
const QueryTokenPairResponse$json = const {
  '1': 'QueryTokenPairResponse',
  '2': const [
    const {'1': 'token_pair', '3': 1, '4': 1, '5': 11, '6': '.aioz.aiozrc20.v1.TokenPair', '8': const {}, '10': 'tokenPair'},
  ],
};

/// Descriptor for `QueryTokenPairResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenPairResponseDescriptor = $convert.base64Decode('ChZRdWVyeVRva2VuUGFpclJlc3BvbnNlEkAKCnRva2VuX3BhaXIYASABKAsyGy5haW96LmFpb3pyYzIwLnYxLlRva2VuUGFpckIEyN4fAFIJdG9rZW5QYWly');
@$core.Deprecated('Use queryParamsRequestDescriptor instead')
const QueryParamsRequest$json = const {
  '1': 'QueryParamsRequest',
};

/// Descriptor for `QueryParamsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsRequestDescriptor = $convert.base64Decode('ChJRdWVyeVBhcmFtc1JlcXVlc3Q=');
@$core.Deprecated('Use queryParamsResponseDescriptor instead')
const QueryParamsResponse$json = const {
  '1': 'QueryParamsResponse',
  '2': const [
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.aioz.aiozrc20.v1.Params', '8': const {}, '10': 'params'},
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode('ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEjYKBnBhcmFtcxgBIAEoCzIYLmFpb3ouYWlvenJjMjAudjEuUGFyYW1zQgTI3h8AUgZwYXJhbXM=');
