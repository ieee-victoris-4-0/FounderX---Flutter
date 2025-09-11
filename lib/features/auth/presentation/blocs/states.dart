import 'package:founderx/core/exceptions/failure.dart';
class PasswordCriteriaState{
  Map<String,int> passwordRef;
  PasswordCriteriaState({required this.passwordRef});
}
// Password visibility states
class PasswordVisibilityState{
  bool isPasswordVisible;
  PasswordVisibilityState({required this.isPasswordVisible});
}
// other authentication methods states
class OtherAuthenticationState{
  Failure ? failure;
  OtherAuthenticationState({this.failure});
}

class InitOtherAuthenticationState extends OtherAuthenticationState {}

class LoadingOtherAuthenticationState extends OtherAuthenticationState {}

class SuccessOtherAuthenticationState extends OtherAuthenticationState {}

class ErrorOtherAuthenticationState extends OtherAuthenticationState {
  ErrorOtherAuthenticationState({ super.failure});
}
// Login states
class LoginState{
  

}
class InitialLoginState extends LoginState {
   InitialLoginState();
}
class LoadingLoginState extends LoginState {
   LoadingLoginState();
}
class SuccessLoginState extends LoginState {
  
   SuccessLoginState();
}
class ErrorLoginState extends LoginState {
  final Failure failure;
   ErrorLoginState({required this.failure});
}
// Register states
class RegisterState{
  const RegisterState();
}
class InitialRegisterState extends RegisterState {
  const InitialRegisterState();
}
class LoadingRegisterState extends RegisterState {
  const LoadingRegisterState();
}
class SuccessRegisterState extends RegisterState {
  const SuccessRegisterState();
}
class ErrorRegisterState extends RegisterState {
  final Failure failure;
  const ErrorRegisterState({required this.failure});
}
// Set password states
class SetPasswordState{
  const SetPasswordState();
}
class InitialSetPasswordState extends SetPasswordState {
  const InitialSetPasswordState();
}
class LoadingSetPasswordState extends SetPasswordState {
  const LoadingSetPasswordState();
}
class SuccessSetPasswordState extends SetPasswordState {
  const SuccessSetPasswordState();
}
class ErrorSetPasswordState extends SetPasswordState {
  final Failure failure;
  const ErrorSetPasswordState({required this.failure});
}
// Forget password states
class ForgetPasswordState{
  const ForgetPasswordState();
}
class InitialForgetPasswordState extends ForgetPasswordState {
  const InitialForgetPasswordState();
}
class LoadingForgetPasswordState extends ForgetPasswordState {
  const LoadingForgetPasswordState();
}
class SuccessForgetPasswordState extends ForgetPasswordState {
  const SuccessForgetPasswordState();
}
class ErrorForgetPasswordState extends ForgetPasswordState {
  final Failure failure;
  const ErrorForgetPasswordState({required this.failure});
}
// Verification code states
class VerificationCodeState{
  const VerificationCodeState();
}
class InitialVerificationCodeState extends VerificationCodeState {
  const InitialVerificationCodeState();
}
class LoadingVerificationCodeState extends VerificationCodeState {
  const LoadingVerificationCodeState();
}
class SuccessVerificationCodeState extends VerificationCodeState {
  const SuccessVerificationCodeState();
}
class ErrorVerificationCodeState extends VerificationCodeState {
  final Failure failure;
  const ErrorVerificationCodeState({required this.failure});
}