import 'package:founderx/features/auth/data/models/DTO/forgetPassword_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/register_DTO.dart';
import 'package:founderx/features/auth/data/models/response_models/forgetPassword_model.dart';
import 'package:founderx/features/auth/data/models/response_models/login_model.dart';
import 'package:founderx/features/auth/data/models/response_models/other_auth_model.dart';
import 'package:founderx/features/auth/data/models/response_models/setPassword_model.dart';
import 'package:founderx/features/auth/data/models/response_models/verificationCode_model.dart';
import 'package:founderx/features/auth/domain/entity/auth_entity.dart';
import 'package:founderx/features/auth/domain/repositories/domain_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:founderx/core/exceptions/failure.dart';

import '../../data/models/DTO/login_DTO.dart';
import '../../data/models/DTO/setPassword_DTO.dart';
import '../../data/models/DTO/verificationCode_DTO.dart';

class RegisterUseCase{
  final DomainRepository domainRepository;
  RegisterUseCase({required this.domainRepository});
  Future<Either<Failure, AuthEntity>> call(RegisterDto registerModel){
    return domainRepository.registerUser(registerModel);
  }
}
class LoginUseCase{
  final DomainRepository domainRepository;
  LoginUseCase({required this.domainRepository});
  Future<Either<Failure, LoginModel>> call(LoginDto loginModel) async{
    return await domainRepository.loginUser(loginModel);
  }
}
class VerifyUseCase{
  final DomainRepository domainRepository;
  VerifyUseCase({required this.domainRepository});
  Future<Either<Failure, VerificationCodeModel>> call(VerificationCodeDto verificationCodeModel){
    return domainRepository.verifyUser(verificationCodeModel);
  }
}
class SetPasswordUseCase{
  final DomainRepository domainRepository;
  SetPasswordUseCase({required this.domainRepository});
  Future<Either<Failure, SetPasswordModel>> call(SetPasswordDto setPasswordModel){
    return domainRepository.setPassword(setPasswordModel);
  }
}
class ForgetPasswordUseCase{
  final DomainRepository domainRepository;
  ForgetPasswordUseCase({required this.domainRepository});
  Future<Either<Failure, ForgetPasswordModel>> call(ForgetPasswordDto forgetPasswordModel){
    return domainRepository.forgetPassword(forgetPasswordModel);
  }
}
class OtherAuthenticationUseCase{
  final DomainRepository domainRepository;
  OtherAuthenticationUseCase({required this.domainRepository});
  Future<Either<Failure, OtherAuthModel>> call(){
    return domainRepository.otherAuthentication();
  }
}
