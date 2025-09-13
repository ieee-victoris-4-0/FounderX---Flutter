import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class LoginModel extends AuthEntity{
  final String createdAt;
  final String updatedAt;
  final String verificationCodeSentAt;
  final String role;
  final String emailVerifiedAt;
  @override
  final String message;
  const LoginModel({
   required super.id,
    required super.email,
  required super.fullName,
  required super.token,
  required this.createdAt,
  required this.updatedAt,
  required this.verificationCodeSentAt,
  required this.role,
  required this.emailVerifiedAt,
  required this.message,
   });
   factory LoginModel.fromJson(Map<String,dynamic> json){
    return LoginModel( 
      id: json["user"]["id"],
      email: json["user"]["email"],
      fullName: json["user"]["name"],
      createdAt: json["user"]["created_at"],
      updatedAt: json["user"]["updated_at"],
      verificationCodeSentAt: json["user"]["verification_code_sent_at"],
      emailVerifiedAt: json["user"]["email_verified_at"],
      token: json["token"],
      role: json["user"]["role"],
      message: json["message"],
    );
   }
Map<String, dynamic> toJson() {
  return {
    "user": {
      "id": id,
      "name": fullName,
      "email": email,
      "email_verified_at": emailVerifiedAt,
      "role": role,
      "verification_code_sent_at": verificationCodeSentAt,
      "created_at": createdAt,
      "updated_at": updatedAt,
    },
    "token": token,
    "message": message,
  };
}
   @override
   List<Object?> get props => [
    id,
    email,
    fullName,
    token,
    createdAt,
    updatedAt,
    verificationCodeSentAt,
    role,
    emailVerifiedAt,
    message,
   ];
}