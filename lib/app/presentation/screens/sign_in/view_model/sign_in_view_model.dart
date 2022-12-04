import 'dart:async';
import 'package:medita_patient/app/base/base_view_model.dart';
import 'package:medita_patient/app/domain/use_cases/login_use_case.dart';
import 'package:medita_patient/app/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _emailStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

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
  Stream<bool> get outIsValidEmail =>
      _emailStreamController.stream.map((email) => isValidEmail(email));

  @override
  Stream<bool> get outIsValidPassword => _passwordStreamController.stream
      .map((password) => isValidPassword(password));

  bool isValidEmail(String email) {
    return email.isNotEmpty;
  }

  bool isValidPassword(String password) {
    return password.isNotEmpty;
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    loginObject = loginObject.copyWith(email: email);
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }
}

abstract class LoginViewModelInputs {
  setEmail(String email);

  setPassword(String password);

  login();

  Sink get inputEmail;

  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsValidEmail;

  Stream<bool> get outIsValidPassword;
}
