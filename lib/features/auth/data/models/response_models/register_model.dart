
import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class RegisterModel extends AuthEntity{
  final String message;
  const RegisterModel({required super.id,
  required this.message,
    });
   factory RegisterModel.fromJson(Map<String,dynamic> json){
    return RegisterModel(
      id: json["id"],
      message: json["message"],
    );
   }
  @override
  List<Object?> get props => [
    id,
    message,
  ];
}