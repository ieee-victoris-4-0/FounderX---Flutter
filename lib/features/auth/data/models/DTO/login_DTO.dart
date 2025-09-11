import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class LoginDto extends AuthEntity{
  const LoginDto({required super.email,
   required super.password,
   });
   Map<String,dynamic> tojson(){
    return {
      "email":email,
      "password":password,
    };
   }
}