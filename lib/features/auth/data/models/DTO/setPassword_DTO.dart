class SetPasswordDto {
  final String password;
  final String passwordConfirmation;
  const SetPasswordDto({
   required this.password,
   required this.passwordConfirmation});
   Map<String,dynamic> tojson(){
    return {
      "password":password,
      "passwordConfirmation":passwordConfirmation,
    };
   }
}