///
//  Generated code. Do not modify.
//  source: cosmos/crypto/secp256r1/keys.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use pubKeyDescriptor instead')
const PubKey$json = const {
  '1': 'PubKey',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'key'},
  ],
};

/// Descriptor for `PubKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pubKeyDescriptor = $convert.base64Decode('CgZQdWJLZXkSHQoDa2V5GAEgASgMQgva3h8HZWNkc2FQS1IDa2V5');
@$core.Deprecated('Use privKeyDescriptor instead')
const PrivKey$json = const {
  '1': 'PrivKey',
  '2': const [
    const {'1': 'secret', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'secret'},
  ],
};

/// Descriptor for `PrivKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List privKeyDescriptor = $convert.base64Decode('CgdQcml2S2V5EiMKBnNlY3JldBgBIAEoDEIL2t4fB2VjZHNhU0tSBnNlY3JldA==');
