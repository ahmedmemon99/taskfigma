import 'package:flutter/cupertino.dart';

class AuthEvent{

}

class LoginEvent extends AuthEvent{

  LoginEvent({required this.emailKey,required this.pwdKey});

  final GlobalKey<FormFieldState> emailKey;
  final GlobalKey<FormFieldState> pwdKey;

}

class ErrorEvent extends AuthEvent{

  ErrorEvent({required this.emailText,required this.passwordText});

  String emailText;
  String passwordText;
}