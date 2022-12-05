import 'package:flutter/material.dart';

@immutable
abstract class SignInState {}

class SignInInitSate extends SignInState {}
class SignInObscureTextChangeSate extends SignInState {}
class SignInIsRememberMeChangeSate extends SignInState {}