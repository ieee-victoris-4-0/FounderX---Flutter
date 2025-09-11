
import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class ForgetPasswordModel extends AuthEntity{
  const ForgetPasswordModel({required super.id,
   required super.email});
  factory ForgetPasswordModel.fromJson(Map<String,dynamic> json){
    return ForgetPasswordModel(
      id: json["id"],
      email: json["email"],
    );
  }
  @override
  List<Object?> get props => [
    email,
  ];
}