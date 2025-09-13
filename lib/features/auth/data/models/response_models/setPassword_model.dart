import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class SetPasswordModel extends AuthEntity{
   const SetPasswordModel({
   required super.message,
       });
      factory SetPasswordModel.fromJson(Map<String,dynamic> json){
        return SetPasswordModel(
          message: json["message"],
        );
      }
}