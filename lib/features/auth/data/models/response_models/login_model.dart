import 'package:founderx/features/auth/domain/entity/auth_entity.dart';

class LoginModel extends AuthEntity{
  final String createdAt;
  final String updatedAt;
  final bool isverified;
  final String verificationCodeSentAt;
  final String role;
  final String emailVerifiedAt;
  final String message;
  const LoginModel({
   required super.id,
    required super.email,
  required super.fullName,
  required super.token,
  required this.createdAt,
  required this.updatedAt,
  required this.isverified,
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
      isverified: json["verified"],
      verificationCodeSentAt: json["verification_code_sent_at"],
      token: json["token"],
      role: json["user"]["role"],
      emailVerifiedAt: json["user"]["email_verified_at"],
      message: json["message"],
    );
   }
Map<String, dynamic> toJson() {
  return {
    "user": {
      "id": id,
      "email": email,
      "name": fullName,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "role": role,
      "email_verified_at": emailVerifiedAt,
    },
    "verified": isverified,
    "verification_code_sent_at": verificationCodeSentAt,
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
    isverified,
    verificationCodeSentAt,
    role,
    emailVerifiedAt,
    message,
   ];
}