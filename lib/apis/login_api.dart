import 'package:flutter/foundation.dart' show immutable;
import 'package:loginbloc/models.dart';

@immutable
abstract class LoginApiProtocal {
  const LoginApiProtocal();
  Future<LoginHandler?> login({
    required String username,
    required String password,
  });
}

@immutable
class LoginApi implements LoginApiProtocal {
  /* const LoginApi._sharedInstance();
  static const LoginApi _shared = LoginApi._sharedInstance();
  factory LoginApi.instance() => _shared; */

  @override
  Future<LoginHandler?> login({
    required String username,
    required String password,
  }) =>
      Future.delayed(
        const Duration(seconds: 3),
        () => username == 'yasser@hotmail.com' && password == '1234',
      ).then((isLoggin) => isLoggin ? const LoginHandler.foobar() : null);
}
