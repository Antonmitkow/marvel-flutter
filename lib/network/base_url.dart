import 'dart:convert';

import 'package:crypto/crypto.dart';

const publicKey = '195407be4c0fc9132bac1d688c2efdab';
const _privateKey = 'fdc4a01cb6658f3e1601e98cf071f2974f4f4154';
const baseUrl = 'http://gateway.marvel.com/v1/public/characters?';
final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
final hash =
    md5.convert(utf8.encode('$timeStamp$_privateKey$publicKey')).toString();
