import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medita_patient/app/data/models/registration.dart';
import 'package:medita_patient/app/domain/use_cases/registration/registration_use_case.dart';
import 'package:medita_patient/app/presentation/common/freezed_data_classes.dart';
import 'package:medita_patient/app/presentation/screens/sign_up/cubit/sign_up_status.dart';

import '../../../../data/models/data/failure/auth/auth_failure.dart';
import '../../../manager/routes_manager.dart';
import '../../../manager/string_manager.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._registerUseCase) : super(SignUpInitState());

  final RegisterUseCase _registerUseCase;
  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);

  RegisterObject registerObject = RegisterObject("", "", "", "");

  bool isLoadingState = false;

  /// this variable store the value if the user want to show the password or not
  bool isObscureText = true;

  String? errorText;

  /// Email validation method using [firstName]
  /// is [firstName] is null or empty
  /// return empty message [StringManager.firstNameCantBeEmpty]
  String? isValidFirstName(String? firstName) {
    if (firstName == null || firstName.isNotEmpty) {
      return null;
    } else {
      return StringManager.firstNameCantBeEmpty;
    }
    // TODO: add more validation logic
  }

  /// Password validation method using [lastName]
  /// is [lastName] is null or empty
  /// return empty message [StringManager.lastNameCantBeEmpty]
  String? isValidLastName(String? lastName) {
    if (lastName == null || lastName.isNotEmpty) {
      return null;
    } else {
      return StringManager.passwordCantBeEmpty;
    }
  }

  /// Email validation method using [email]
  /// is [email] is null or empty
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

  /// Email value setter method
  void setEmail(String email) {
    registerObject = registerObject.copyWith(email: email);
  }

  /// Password value setter method
  void setPassword(String password) {
    registerObject = registerObject.copyWith(password: password);
  }

  /// First name value setter method
  void setFirstName(String firstName) {
    registerObject = registerObject.copyWith(firstName: firstName);
  }

  /// Last name value setter method
  void setLastName(String lastName) {
    registerObject = registerObject.copyWith(lastname: lastName);
  }

  /// change [isObscureText] variable value
  /// if true => false || if false => true
  void changeObscureTextState() {
    isObscureText = !isObscureText;
    emit(SignUpObscureTextChangeSate());
  }

  void register() async {
    isLoadingState = true;
    emit(SignUpLoadingSate());

    String firstName = registerObject.firstName;
    String lastName = registerObject.lastname;
    String email = registerObject.email;
    String password = registerObject.password;

    RegistrationUseCaseInput registrationUseCaseInput = RegistrationUseCaseInput(firstName, lastName, email, password);
    Either<Failure, Registration> responseData = await _registerUseCase.execute(registrationUseCaseInput);

    responseData.fold((failure) {
      errorText = failure.message;
      if (kDebugMode) {
        print(errorText);
      }
      emit(SignUpFailSate());
    }, (registrationModel) {
      emit(SignUpSuccessSate());
    });

    isLoadingState = false;
    emit(SignUpProcessEndSate());
  }

  void navigateToSignInScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.signInRoute);
  }
}