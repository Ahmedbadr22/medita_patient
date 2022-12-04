import 'dart:async';
import 'package:medita_patient/app/base/base_view_model.dart';
import 'package:medita_patient/app/domain/use_cases/login_use_case.dart';
import 'package:medita_patient/app/presentation/common/freezed_data_classes.dart';
import 'package:medita_patient/app/presentation/manager/string_manager.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _emailStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  bool isObscurePassword = true;

  LoginObject loginObject = LoginObject("", "");

  // inputs
  @override
  void dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  login() async {
    String email = loginObject.email;
    String password = loginObject.password;
    LoginUseCaseInput input = LoginUseCaseInput(email, password);
    (await _loginUseCase.execute(input)).fold((failure) {
      print("Fail ===> ${failure.message}");
    }, (token) => {
      print("====> $token")
    });
  }

  // outputs
  @override
  Stream<String?> get outIsValidEmail =>
      _emailStreamController.stream.map((email) => isValidEmail(email));

  @override
  Stream<String?> get outIsValidPassword => _passwordStreamController.stream
      .map((password) => isValidPassword(password));

  String? isValidEmail(String email) {
    if (email.isNotEmpty) {
      return null;
    } else {
      return StringManager.emailCantBeEmpty;
    }
  }

  String? isValidPassword(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return StringManager.passwordCantBeEmpty;
    }
  }

  @override
  void setEmail(String email) {
    inputEmail.add(email);
    loginObject = loginObject.copyWith(email: email);
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  void convertObscurePasswordState() {

  }
}

abstract class LoginViewModelInputs {
  /// this function set the user entered email in the LoginObject instance
  void setEmail(String email);

  /// this function set the user entered password in the LoginObject instance
  void setPassword(String password);

  /// this function execute the login api call
  void login();

  /// this function change the obscure icon state
  convertObscurePasswordState();
  Sink get inputEmail;

  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<String?> get outIsValidEmail;

  Stream<String?> get outIsValidPassword;
}
