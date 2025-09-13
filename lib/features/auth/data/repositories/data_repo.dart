import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:founderx/core/exceptions/exceptions.dart';
import 'package:founderx/core/exceptions/failure.dart';
import 'package:founderx/features/auth/data/models/DTO/forgetPassword_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/login_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/register_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/setPassword_DTO.dart';
import 'package:founderx/features/auth/data/models/DTO/verificationCode_DTO.dart';
import 'package:founderx/features/auth/data/models/response_models/forgetPassword_model.dart';
import 'package:founderx/features/auth/data/models/response_models/login_model.dart';
import 'package:founderx/features/auth/data/models/response_models/setPassword_model.dart';
import 'package:founderx/features/auth/data/models/response_models/verificationCode_model.dart';
import 'package:founderx/features/auth/domain/repositories/domain_repository.dart';
import '../dataSource/remote_datasource.dart';
import '../models/response_models/other_auth_model.dart';
import '../models/response_models/register_model.dart';
class AuthDataRepo implements DomainRepository{
  final RemoteDataSource remoteDataSource;
  AuthDataRepo({required this.remoteDataSource});
  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(ForgetPasswordDto forgetPasswordDto) async{
    try{
      final result=await  remoteDataSource.forgetPassword(forgetPasswordDto.toJson());
      return Right(ForgetPasswordModel.fromJson(result));
    }
    catch(e){
      return Left(ServerFailure(message:tr("failures.server")) );
    }
  }

  @override
  Future<Either<Failure, LoginModel>> loginUser(LoginDto loginDto) async{
    try{
      final result=await  remoteDataSource.login(loginDto.tojson());
      return Right(LoginModel.fromJson(result));
    }on InvalidCredentialsException{
      return Left(InvalidCredentialsFailure(message:tr("Invalid cedentials error")) );
    }
    catch(e){
      return Left(ServerFailure(message:tr("failures.server")) );
    }
  }

  @override
  Future<Either<Failure, OtherAuthModel>> otherAuthentication() async{
    try{
      final result=await  remoteDataSource.signInWithGoogle();

      return Right(OtherAuthModel.fromJson(result));
    }
    catch(e){
      return Left(ServerFailure(message:tr("failures.server")) );
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> registerUser(RegisterDto registerDto) async{
    try{
      final result=await  remoteDataSource.register(registerDto.tojson());
      return Right(RegisterModel.fromJson(result));
    }on UserAlreadyFoundException{
      return Left(UserAlreadyFoundFailure(message:tr("failures.userAlreadyFound")) );
    }
    catch(e){
      print("##########################");
      print(e);
      print("##########################");
      return Left(ServerFailure(message:tr("failures.server")) );
    }
  }

  @override
  Future<Either<Failure, SetPasswordModel>> setPassword(SetPasswordDto setPasswordDto) async{
    try{
      final result=await  remoteDataSource.setpassword(setPasswordDto.tojson());
      return Right(SetPasswordModel.fromJson(result));
    }
    catch(e){
      return Left(ServerFailure(message:tr("failures.server")) );
    }
  }

  @override
  Future<Either<Failure, VerificationCodeModel>> verifyUser(VerificationCodeDto verificationCodeDto) async{
    try{
      final result=await  remoteDataSource.verify(verificationCodeDto.toJson());
      return Right(VerificationCodeModel.fromJson(result));
    }
    catch(e){
      return Left(ServerFailure(message:tr("failures.server")) );
    }
  }

}