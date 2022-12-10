class RegistrationFailure {
  int statusCode;
  String? firstNameError;
  String? lastNameError;
  String? emailError;
  String? passwordError;

  RegistrationFailure(this.statusCode, this.firstNameError, this.lastNameError, this.emailError, this.passwordError);
}