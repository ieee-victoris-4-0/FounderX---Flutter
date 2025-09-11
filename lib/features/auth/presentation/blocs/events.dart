import 'package:founderx/features/auth/data/models/DTO/forgetPassword_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/setPassword_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/verificationCode_DTO.dart';
import '../../data/models/DTO/login_DTO.dart';
import '../../data/models/DTO/register_DTO.dart';
// Password criteria events
class PasswordCriteriaEvent{
  Map<String,int> passwordRef;
  PasswordCriteriaEvent({required this.passwordRef});
}
// Password visibility events
class PasswordVisibilityEvent{
  bool isPasswordVisible;
  PasswordVisibilityEvent({required this.isPasswordVisible});
}
// Other authentication events
class OtherAuthenticationEvent{}
class InitOtherAuthenticationEvent extends OtherAuthenticationEvent{}
class LoadingOtherAuthenticationEvent extends OtherAuthenticationEvent{}
// Login events
class LoginEvent{
  
  LoginEvent();
}
class InitLoginEvent extends LoginEvent{}
class LoadingLoginEvent extends LoginEvent{
  LoginDto loginDto;
  LoadingLoginEvent({required this.loginDto});
}
// Register events
class RegisterEvent{
}
class InitRegisterEvent extends RegisterEvent{}
class LoadingRegisterEvent extends RegisterEvent{
  final RegisterDto registerDto;
  LoadingRegisterEvent({required this.registerDto});
}
// Set password events
class SetPasswordEvent{
  SetPasswordDto ? setPasswordDto;
  SetPasswordEvent({ this.setPasswordDto});
}
class InitSetPasswordEvent extends SetPasswordEvent{}
class LoadingSetPasswordEvent extends SetPasswordEvent{
  LoadingSetPasswordEvent({super.setPasswordDto});
}
// Forget password events
class ForgetPasswordEvent{
  ForgetPasswordDto ? forgetPasswordDto;
  ForgetPasswordEvent({ this.forgetPasswordDto});
}
class InitForgetPasswordEvent extends ForgetPasswordEvent{}
class LoadingForgetPasswordEvent extends ForgetPasswordEvent{
  LoadingForgetPasswordEvent({super.forgetPasswordDto});
}
// Verification code events
class VerificationCodeEvent{
  VerificationCodeDto ? verificationCodeDto;
  VerificationCodeEvent({ this.verificationCodeDto});
}
class InitVerificationCodeEvent extends VerificationCodeEvent{}
class LoadingVerificationCodeEvent extends VerificationCodeEvent{
  LoadingVerificationCodeEvent({super.verificationCodeDto});
}


