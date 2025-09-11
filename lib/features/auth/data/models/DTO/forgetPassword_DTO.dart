
class ForgetPasswordDto {
  final String email;
  const ForgetPasswordDto({required this.email});
   Map<String,dynamic> toJson(){
    return {
      "email":email,
    };
   }
}