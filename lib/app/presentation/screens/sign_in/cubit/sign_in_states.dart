import 'package:flutter/material.dart';

@immutable
abstract class SignInState {}

class SignInInitSate extends SignInState {}
class SignInObscureTextChangeSate extends SignInState {}
class SignInIsRememberMeChangeSate extends SignInState {}
class SignInLoadingSate extends SignInState {}
class SignInSuccessSate extends SignInState {}
class SignInFailSate extends SignInState {}
class SignInProcessEndSate extends SignInState {}