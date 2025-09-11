import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class OtherAuthModel extends AuthEntity{
  const OtherAuthModel({required super.fullName , required super.id , required super.token});
  factory OtherAuthModel.fromJson(Map<String,dynamic> json){
    return OtherAuthModel(
      fullName: json["fullName"],
      id: json["id"],
      token: json["token"],
    );
  }
  @override
  List<Object?> get props => [
    fullName,
    id,
    token,
  ];
}