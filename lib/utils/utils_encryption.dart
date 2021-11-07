import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

/// Encryption and decryption tools
class EncryptUtils {
  /// md5 Encrypted string
  static String encodeMd5(String data) {
    var content = Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  /// md5 Encrypted file
  static String encodeMd5File(File file) {
    var readAsStringSync = file.readAsStringSync();
    var content = Utf8Encoder().convert(readAsStringSync);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  /// XOR symmetric encryption
  static String xorCode(String res, String key) {
    List<String> keyList = key.split(',');
    List<int> codeUnits = res.codeUnits;
    List<int> codes = [];
    for (int i = 0, length = codeUnits.length; i < length; i++) {
      int code = codeUnits[i] ^ int.parse(keyList[i % keyList.length]);
      codes.add(code);
    }
    return String.fromCharCodes(codes);
  }

  /// XOR symmetric Base64 encryption
  static String xorBase64Encode(String res, String key) {
    String encode = xorCode(res, key);
    encode = encodeBase64(encode);
    return encode;
  }

  /// XOR Symmetric Base64 Decryption
  static String xorBase64Decode(String res, String key) {
    String encode = decodeBase64(res);
    encode = xorCode(encode, key);
    return encode;
  }

  /// Base64 encrypted string
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /// Base64 decrypt string
  static String decodeBase64(String data) {
    List<int> bytes = base64Decode(data);
    String result = utf8.decode(bytes);
    return result;
  }

  // AES Algorithm Encode - Decode
}
