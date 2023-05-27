
abstract class SignUpState {
  bool loading;

  SignUpState({this.loading = false});
}
class SignUpInitState extends SignUpState {}
class SignUpObscureTextChangeSate extends SignUpState {}
class SignUpProcessEndSate extends SignUpState {}
class SignUpSuccessSate extends SignUpState {}
class SignUpFailSate extends SignUpState {}
class SignUpLoadingSate extends SignUpState {
  SignUpLoadingSate(bool loading) : super(loading: loading);
}
