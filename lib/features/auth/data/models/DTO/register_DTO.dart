
class RegisterDto {
  final String email;
  final String fullName;
  const RegisterDto({required this.email,
   required this.fullName,
    });
   Map<String,dynamic> tojson(){
    return {
      "email":email,
      "fullName":fullName,
    };
   }
}