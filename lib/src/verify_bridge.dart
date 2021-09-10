import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:hex/hex.dart';

import 'bindings.dart';
import 'sgx_client_error.dart';

class VerifyBridge {
  static DynamicLibrary? _lib;

  static void _loadLib() {
    _lib = _open();
  }

  static bool verify(X509Certificate cert) {
    if (_lib == null) {
      _loadLib();
    }
    final der = HEX.encode(cert.der);
    if(der.length != 6332) {
      throw SgxClientError('Bad certificate');
    }
    final result = VerifyBindings(_lib!)
        .verify_mra_cert(HEX.encode(cert.der).toNativeUtf8().cast<Int8>())
        .cast<Utf8>()
        .toDartString();

    log(result);
    _free(result);
    if (result == 'Success') {
      return true;
    } else {
      throw SgxClientError(result);
    }
  }

  static DynamicLibrary _open() {
    if (Platform.isAndroid) return DynamicLibrary.open('libverify_mra_cert.so');
    if (Platform.isIOS) return DynamicLibrary.executable();
    throw UnsupportedError('This platform is not supported.');
  }

  static void _free(String value) {
    final ptr = value.toNativeUtf8().cast<Int8>();
    return VerifyBindings(_lib!).rust_cstr_free(ptr);
  }
}
