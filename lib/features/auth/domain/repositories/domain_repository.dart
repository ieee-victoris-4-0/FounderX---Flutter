import 'package:founderx/features/auth/data/models/DTO/register_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/login_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/verificationCode_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/setPassword_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/forgetPassword_DTO.dart';
import 'package:dartz/dartz.dart';
import 'package:founderx/core/exceptions/failure.dart';
import 'package:founderx/features/auth/data/models/response_models/forgetPassword_model.dart';
import 'package:founderx/features/auth/data/models/response_models/login_model.dart';
import 'package:founderx/features/auth/data/models/response_models/other_auth_model.dart';
import 'package:founderx/features/auth/data/models/response_models/register_model.dart';
import 'package:founderx/features/auth/data/models/response_models/setPassword_model.dart';
import 'package:founderx/features/auth/data/models/response_models/verificationCode_model.dart';
abstract class DomainRepository {
  Future<Either<Failure, RegisterModel>> registerUser(RegisterDto registerModel);
  Future<Either<Failure, LoginModel>> loginUser(LoginDto loginModel);
  Future<Either<Failure, VerificationCodeModel>> verifyUser(VerificationCodeDto verificationCodeModel);
  Future<Either<Failure, SetPasswordModel>> setPassword(SetPasswordDto setPasswordModel);
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(ForgetPasswordDto forgetPasswordModel);
  Future<Either<Failure, OtherAuthModel>> otherAuthentication();
}