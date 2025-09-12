import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class SetPasswordDto extends AuthEntity{
  const SetPasswordDto({
   required super.password,
   required super.id,
   required super.passwordConfirmation
   });
   Map<String,dynamic> tojson(){
    return {
      "password":password,
      "password_confirmation":passwordConfirmation,
      "user_id":id
    };
   }
}