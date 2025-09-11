import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class SetPasswordModel extends AuthEntity{
  @override
  final String password;
  @override
  final String passwordConfirmation;
  const SetPasswordModel({
   required super.id,
   required this.password,
   required this.passwordConfirmation,
   required super.email,
       });
      factory SetPasswordModel.fromJson(Map<String,dynamic> json){
        return SetPasswordModel(
          id: json["id"],
          password: json["password"],
          passwordConfirmation: json["passwordConfirmation"],
          email: json["email"],
        );
      }
}