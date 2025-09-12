import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class VerificationCodeDto extends AuthEntity{
  const VerificationCodeDto({required super.id,
   required super.otpConfirmationCode});
   Map<String,dynamic> toJson(){
    return {
      "user_id":id.toString(),
      "code":otpConfirmationCode,
    };
   }
}