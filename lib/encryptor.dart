import 'package:encrypt/encrypt.dart';

class MyEncryptionClass{

  static final key = Key.fromUtf8('+8GN+Kqe#DF+!dnh#^t*@veZv@@b@sXj');
  static final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  static final iv = IV.fromUtf8('hCXwmZwuPTditjHL');
  static encryptAES(text){
    final encrypted = encrypter.encrypt(text, iv: iv);
    print(key);
    print(encrypted);
    return encrypted.base64;
  }
  static decryptAES(text){
  final decrypted = encrypter.decrypt(text, iv: iv);
  return decrypted;
  }
}