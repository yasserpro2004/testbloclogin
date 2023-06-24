import 'package:flutter/material.dart';
import 'package:loginbloc/strings.dart';

import '../dialogs/generic_dialog.dart';

typedef OnLoginTapped = void Function(
  String email,
  String password,
);

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final OnLoginTapped loginTapped;
  
  const LoginButton({
    super.key,
    required this.loginTapped,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final email = emailController.text;
        final password = passwordController.text;
        if (email.isEmpty || password.isEmpty) {
          showGenericDialog<bool>(
            context: context,
            title: emailOrPasswordEmptyDialogTitle,
            content: emailOrPasswordEmptyDescription,
            optionBuilder: () => {ok: true},
          );
        } else {
          loginTapped(
             email,
             password,
          );
        }
      },
      child: const Text(login),
    );
  }
}
