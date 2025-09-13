import 'package:founderx/features/auth/domain/usecases/UseCases.dart';
import 'package:founderx/features/auth/presentation/blocs/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/features/auth/presentation/blocs/states.dart';

import '../../data/dataSource/local_datasource.dart';
// Password criteria bloc
class PasswordCriteriaBloc extends Bloc<PasswordCriteriaEvent, PasswordCriteriaState> {
  PasswordCriteriaBloc() : super(PasswordCriteriaState(passwordRef: {"c1":0,"c2":0,"c3":0})) {
    on<PasswordCriteriaEvent>(
      (event, emit) {
          emit(PasswordCriteriaState(passwordRef: event.passwordRef));
            },
    );
  }
}
// Password visibility bloc
class PasswordVisibilityBloc extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  PasswordVisibilityBloc() : super(PasswordVisibilityState(isPasswordVisible: false)) {
    on<PasswordVisibilityEvent>(
      (event, emit) {
          emit(PasswordVisibilityState(isPasswordVisible: event.isPasswordVisible));
            },
    );
  }
}
// Other authentication bloc
class OtherAuthenticationBloc extends Bloc<OtherAuthenticationEvent, OtherAuthenticationState> {
  final OtherAuthenticationUseCase otherAuthenticationUseCase;
  OtherAuthenticationBloc({required this.otherAuthenticationUseCase}) : super(InitOtherAuthenticationState()) {
    on<InitOtherAuthenticationEvent>(_init);
    on<LoadingOtherAuthenticationEvent>(_loading);
  }
void _init(OtherAuthenticationEvent event, Emitter<OtherAuthenticationState> emit) {
  emit(InitOtherAuthenticationState());
}
void _loading(OtherAuthenticationEvent event, Emitter<OtherAuthenticationState> emit) async{
  emit(LoadingOtherAuthenticationState());
  await otherAuthenticationUseCase.call().then((value) {
    value.fold((failure){
      emit(ErrorOtherAuthenticationState(failure: failure));
    }, (success){
      emit(SuccessOtherAuthenticationState());
    });
  });
}

}
// Login bloc
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final LocalDatasource localDataSource;
  LoginBloc({required this.loginUseCase , required this.localDataSource}) : super(InitialLoginState()) {
    on<InitLoginEvent>(_init);
    on<LoadingLoginEvent>(_loading);
  }
 _init(LoginEvent event, Emitter<LoginState> emit) {
  emit(InitialLoginState());
}
 _loading(LoadingLoginEvent event, Emitter<LoginState> emit) async{
  emit(LoadingLoginState());
  await loginUseCase.call(event.loginDto).then((value) async{
    value.fold((failure){
      emit(ErrorLoginState(failure: failure));
      print("====================");
      print(failure.message);
      print("====================");
    }, (success) async{
      emit(SuccessLoginState());
       await localDataSource.setUserData(success.id.toString(),success.toJson());
    });
  });
}
}
// register bloc
class RegisterBloc extends Bloc<RegisterEvent , RegisterState>{
  final RegisterUseCase registerUseCase;
  RegisterBloc({required this.registerUseCase}) : super(InitialRegisterState()) {
    on<InitRegisterEvent>(_init);
    on<LoadingRegisterEvent>(_loading);
  }
  _init(InitRegisterEvent event, Emitter<RegisterState> emit) {
    emit(InitialRegisterState());
  }
  _loading(LoadingRegisterEvent event, Emitter<RegisterState> emit) async{
    emit(LoadingRegisterState());
    await registerUseCase.call(event.registerDto).then((value) {
      value.fold((failure){
        print("=======+++++++++++++++");
        print(failure.message);
        print("=======+++++++++++++++");
        emit(ErrorRegisterState(failure: failure));
      }, (success){
        print("=======+++++++++++++++");
        print(success.id);
        print("=======+++++++++++++++");
        emit(SuccessRegisterState(id: success.id!));
      });
    });
  }
}
// Forget password bloc
class ForgotPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordUseCase forgotPasswordUseCase;
  ForgotPasswordBloc({required this.forgotPasswordUseCase}) : super(InitialForgetPasswordState()) {
    on<InitForgetPasswordEvent>(_init);
    on<LoadingForgetPasswordEvent>(_loading);
  }
  _init(InitForgetPasswordEvent event, Emitter<ForgetPasswordState> emit){
    emit(InitialForgetPasswordState());
  }
  _loading(LoadingForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) async{
    emit(LoadingForgetPasswordState());
    await forgotPasswordUseCase.call(event.forgetPasswordDto!).then((value) {
      value.fold((failure){
        emit(ErrorForgetPasswordState(failure: failure));
      }, (success){
        emit(SuccessForgetPasswordState());
      });
    });
  }
}
// set password bloc
class SetPasswordBloc extends Bloc<SetPasswordEvent , SetPasswordState>{
  final SetPasswordUseCase setPasswordUseCase;
  SetPasswordBloc({required this.setPasswordUseCase}):super(InitialSetPasswordState()){
    on<InitSetPasswordEvent>(_init);
    on<LoadingSetPasswordEvent>(_loading);
  }
  _init(InitSetPasswordEvent event, Emitter<SetPasswordState> emit){
    emit(InitialSetPasswordState());
  }
  _loading(LoadingSetPasswordEvent event, Emitter<SetPasswordState> emit) async{
    emit(LoadingSetPasswordState());
    await setPasswordUseCase.call(event.setPasswordDto!).then((value) {
      value.fold((failure){
        print("^^^^^^^^^^^^^^^^^");
        emit(ErrorSetPasswordState(failure: failure));
      }, (success){
        emit(SuccessSetPasswordState());
      });
    });
  }

}
// Verification code bloc
class VerificationCodeBloc extends Bloc<VerificationCodeEvent, VerificationCodeState> {
  final VerifyUseCase verificationCodeUseCase;
  VerificationCodeBloc({required this.verificationCodeUseCase}) : super(InitialVerificationCodeState()) {
    on<InitVerificationCodeEvent>(_init);
    on<LoadingVerificationCodeEvent>(_loading);
  }
  _init(VerificationCodeEvent event, Emitter<VerificationCodeState> emit){
    emit(InitialVerificationCodeState());
  }
  _loading(VerificationCodeEvent event, Emitter<VerificationCodeState> emit) async{
    emit(LoadingVerificationCodeState());
    await verificationCodeUseCase.call(event.verificationCodeDto!).then((value) {
      value.fold((failure){
        emit(ErrorVerificationCodeState(failure: failure));
      }, (success){
        emit(SuccessVerificationCodeState());
      });
    });
  }
}

