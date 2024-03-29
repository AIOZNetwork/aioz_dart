import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';

extension Uint8Pointer on Pointer<Uint8> {
  Uint8List toList(int length) {
    final builder = BytesBuilder();
    for (var i = 0; i < length; i++) {
      builder.addByte(this[i]);
    }
    return builder.takeBytes();
  }

  Uint8List toNullTerminatedList(int maxLength) {
    final builder = BytesBuilder();
    for (var i = 0; i < maxLength; i++) {
      builder.addByte(this[i]);
      if (this[i] == 0) {
        break;
      }
    }
    return builder.takeBytes();
  }
}

extension Uint8ListExtensions on Uint8List {
  Pointer<Uint8> toPointer({int? size}) {
    final p = calloc<Uint8>(size ?? length);
    p.asTypedList(size ?? length).setAll(0, this);
    return p as Pointer<Uint8>;
  }

  Uint8List toNullTerminatedList({int? maxLength}) {
    if ((maxLength == null || length < maxLength) && last != 0) {
      return Uint8List(length + 1)..setAll(0, this);
    }

    // return unchanged
    return this;
  }
}

extension Result on int {
  void mustSucceed(String funcName) {
    if (this != 0) {
      throw Exception('$funcName failed with $this');
    }
  }
}
