class VerificationCodeDto {
  final String email;
  final String otpConfirmationCode;
  const VerificationCodeDto({required this.email,
   required this.otpConfirmationCode});
   Map<String,dynamic> toJson(){
    return {
      "email":email,
      "code":otpConfirmationCode,
    };
   }
}