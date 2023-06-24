import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loginbloc/views/email_text_field.dart';
import 'package:loginbloc/views/login_button.dart';
import 'package:loginbloc/views/password_text_field.dart';

class MyLoginView extends HookWidget {
  final OnLoginTapped loginTapped;

  const MyLoginView({required this.loginTapped, super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          EmailTextField(emailController: emailController),
          PasswordTextField(passwordController: passwordController),
          LoginButton(
            loginTapped: loginTapped,
            emailController: emailController,
            passwordController: passwordController,
          )
        ],
      ),
    );
  }
}
