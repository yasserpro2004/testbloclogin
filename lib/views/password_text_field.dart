import 'package:flutter/material.dart';
import 'package:loginbloc/strings.dart' show enterYourPasswordHere;

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      decoration: const InputDecoration(hintText: enterYourPasswordHere),
      obscureText: true,
      obscuringCharacter: '*',
    );
  }
}
