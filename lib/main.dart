import 'package:encydecy/encryptor.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _ctl = new TextEditingController();
  var encryptedText, plainText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EncyDecy'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(controller: _ctl),
            Text('Plain Text', style: TextStyle(fontSize: 24.0)),
            Text(encryptedText == null ? "" : encryptedText is encrypt.Encrypted ? encryptedText.base64 : encryptedText),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text('Encrypt'),
                  onPressed: () {
                    plainText = _ctl.text;
                    setState(() {
                      encryptedText = MyEncryptionClass.encryptAES(plainText);
                      print(encryptedText);
                    });
                  },
                ),
                RaisedButton(
                  child: Text('Decrypt'),
                  onPressed: () {
                    setState(() {
                      encryptedText = MyEncryptionClass.decryptAES(encryptedText);
                    });
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_string_encryption/flutter_string_encryption.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _randomKey = 'Unknown';
//   String _string = "Unknown";
//   String _encrypted = "Unknown";

//   @override
//   initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   initPlatformState() async {
//     final cryptor = new PlatformStringCryptor();

//     final key = await cryptor.generateRandomKey();
//     // final key = 'JNJR9ZtpOsQs+kXRBB0kD8bTuPPxE7bpVFiIMfD/izM=';
//     print("randomKey: $key");

//     final string = "here is the string, here is the string.";
//     final encrypted = await cryptor.encrypt(string, key);
//     final decrypted = await cryptor.decrypt(encrypted, key);

//     assert(decrypted == string);

//     final wrongKey =
//         "jIkj0VOLhFpOJSpI7SibjA==:RZ03+kGZ/9Di3PT0a3xUDibD6gmb2RIhTVF+mQfZqy0=";

//     try {
//       await cryptor.decrypt(encrypted, wrongKey);
//     } on MacMismatchException {
//       print("wrongly decrypted");
//     }

//     final salt = "Ee/aHwc6EfEactQ00sm/0A=="; // await cryptor.generateSalt();
//     final password = "a_strong_password%./😋";
//     final generatedKey = await cryptor.generateKeyFromPassword(password, salt);
//     print("salt: $salt, key: $generatedKey");

//     assert(generatedKey == wrongKey);

//     setState(() {
//       _randomKey = key;
//       _string = string;
//       _encrypted = encrypted;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Plugin example app'),
//         ),
//         body: new Center(
//           child: new Text(
//               'Random key: $_randomKey\n\nString: $_string\n\nEncrypted: $_encrypted'),
//         ),
//       ),
//     );
//   }
// }