// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Dart bindings to call veirfy functions
class VerifyBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  VerifyBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  VerifyBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<ffi.Int8> verify_mra_cert(
    ffi.Pointer<ffi.Int8> pem,
  ) {
    return _verify_mra_cert(
      pem,
    );
  }

  late final _verify_mra_certPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Int8> Function(
              ffi.Pointer<ffi.Int8>)>>('verify_mra_cert');
  late final _verify_mra_cert = _verify_mra_certPtr
      .asFunction<ffi.Pointer<ffi.Int8> Function(ffi.Pointer<ffi.Int8>)>();

  void rust_cstr_free(
    ffi.Pointer<ffi.Int8> s,
  ) {
    return _rust_cstr_free(
      s,
    );
  }

  late final _rust_cstr_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Int8>)>>(
          'rust_cstr_free');
  late final _rust_cstr_free =
      _rust_cstr_freePtr.asFunction<void Function(ffi.Pointer<ffi.Int8>)>();
}
