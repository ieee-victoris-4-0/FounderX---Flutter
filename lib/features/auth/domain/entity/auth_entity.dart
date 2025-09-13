import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final int ? id;
  final String? email;
  final String? fullName;
  final String? password;
  final String? passwordConfirmation;
  final String? otpConfirmationCode;
  final String? token;
  final String? message;
  const AuthEntity({
    this.id,
    this.email,
    this.fullName,
    this.password,
    this.passwordConfirmation,
    this.otpConfirmationCode,
    this.token,
    this.message,
  });
    bool get hasValidEmail {
    if (email == null || email!.isEmpty) return false;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email!);
  }
  bool get hasValidFullName {
    if (fullName == null || fullName!.isEmpty) return false;
    return fullName!.trim().length >= 2;
  }
  Map<String,int> get hasStrongPassword{
    final regExp1=RegExp(r'^(?=.*[*\(&\$@^!]).+$');
    final hasNumber = RegExp(r'.*[0-9].*');
    int c1=0;
    int c2=0;
    int c3=0;
    if(password!.length>=8){
      c1=1;
    }
    if(regExp1.hasMatch(password!)){
      c2=1;
    }
    if(hasNumber.hasMatch(password!)){
      c3=1;
    }
    return {
      "c1":c1,
      "c2":c2,
      "c3":c3,
    };
  }
  bool get hasValidPasswordConfirmation {
    if (passwordConfirmation == null || passwordConfirmation!.isEmpty) return false;
    return passwordConfirmation == password;
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    email,
    fullName,
    password,
    passwordConfirmation,
    otpConfirmationCode,
    token,
    message,
  ];
}
