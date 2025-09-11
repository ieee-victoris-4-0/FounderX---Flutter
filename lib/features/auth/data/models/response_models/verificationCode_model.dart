import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class VerificationCodeModel extends AuthEntity{

  const VerificationCodeModel({required super.id,
   required super.email,
   required super.otpConfirmationCode});
   factory VerificationCodeModel.fromJson(Map<String,dynamic> json){
    return VerificationCodeModel(
      id: json["id"],
      email: json["email"],
      otpConfirmationCode: json["code"],
    );
   }
}