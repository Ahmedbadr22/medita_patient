import 'package:flutter/foundation.dart';

@immutable
abstract class SignUpState {}
class SignUpInitState extends SignUpState {}
class SignUpObscureTextChangeSate extends SignUpState {}
class SignUpProcessEndSate extends SignUpState {}
class SignUpSuccessSate extends SignUpState {}
class SignUpFailSate extends SignUpState {}
class SignUpLoadingSate extends SignUpState {}
