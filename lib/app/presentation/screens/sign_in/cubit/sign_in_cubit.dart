import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/presentation/screens/sign_in/cubit/sign_in_states.dart';

import '../../../../data/models/token.dart';
import '../../../../data/network/failure.dart';
import '../../../../domain/use_cases/login_use_case.dart';
import '../../../common/freezed_data_classes.dart';
import '../../../manager/routes_manager.dart';
import '../../../manager/string_manager.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._loginUseCase) : super(SignInInitSate());

  /// this [LoginUseCase] instance allow us to call the use case methods
  final LoginUseCase _loginUseCase;

  LoginObject loginObject = LoginObject("", "");

  /// this variable store the value if the user want to show the password or not
  bool isObscureText = true;

  /// this variable store the value of if the user want to remember his login token or not
  bool isRememberMe = false;

  static SignInCubit get(BuildContext context) => BlocProvider.of(context);


  /// Email validation method using [email]
  /// is [password] is null or empty
  /// return empty message [StringManager.emailCantBeEmpty]
  String? isValidEmail(String? email) {
    if (email == null || email.isNotEmpty) {
      return null;
    } else {
      return StringManager.emailCantBeEmpty;
    }
    // TODO: add more validation logic
  }

  /// Password validation method using [password]
  /// is [password] is null or empty
  /// return empty message [StringManager.passwordCantBeEmpty]
  String? isValidPassword(String? password) {
    if (password == null || password.isNotEmpty) {
      return null;
    } else {
      return StringManager.passwordCantBeEmpty;
    }
  }

  // Email value setter method
  void setEmail(String email) {
    loginObject = loginObject.copyWith(email: email);
  }

  /// Password value setter method
  void setPassword(String password) {
    loginObject = loginObject.copyWith(password: password);
  }

  /// Execute login using [loginObject]
  void login() async {
    String email = loginObject.email;
    String password = loginObject.password;
    LoginUseCaseInput loginUseCaseInput = LoginUseCaseInput(email, password);
    Either<Failure, Token> responseData = await _loginUseCase.execute(loginUseCaseInput);
    responseData.fold((failure) {
      // TODO : handle on fail logic
    }, (token) => {
      // TODO : handle on success logic
    });
  }

  /// change [isObscureText] variable value
  /// if true => false || if false => true
  void changeObscureTextState() {
    isObscureText = !isObscureText;
    emit(SignInObscureTextChangeSate());
  }

  /// change [isRememberMe] variable value
  /// if true => false || if false => true
  void changeIsRememberMeState(bool? value) {
    isRememberMe = value ?? false;
    emit(SignInIsRememberMeChangeSate());
  }

  /// this function allow you to navigate to signUp Screen
  /// by passing [BuildContext] as the Current Screen BuildContext
  void navigateToSignUpScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.signUpRoute);
  }

  /// this function allow you to navigate to Navigation Screen
  /// by passing [BuildContext] as the Current Screen BuildContext
  void navigateToNavigationScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.navigationRoute);
  }
}