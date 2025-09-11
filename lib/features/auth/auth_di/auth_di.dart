import 'package:founderx/features/auth/data/dataSource/local_datasource.dart';
import 'package:founderx/features/auth/data/dataSource/remote_datasource.dart';
import 'package:founderx/features/auth/data/repositories/data_repo.dart';
import 'package:founderx/features/auth/domain/repositories/domain_repository.dart';
import 'package:founderx/features/auth/domain/usecases/UseCases.dart';
import 'package:founderx/features/auth/presentation/blocs/blocs.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;
authDI(){
  // data source
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(apiClient: sl()));
  sl.registerLazySingleton<LocalDatasource>(() => LocalDatasource(prefs: sl()));
  // repository
  sl.registerLazySingleton<DomainRepository>(() => AuthDataRepo(remoteDataSource: sl()));
  // blocs
  sl.registerFactory<PasswordCriteriaBloc>(() => PasswordCriteriaBloc());
  sl.registerFactory<PasswordVisibilityBloc>(() => PasswordVisibilityBloc());
  sl.registerFactory<OtherAuthenticationBloc>(() => OtherAuthenticationBloc(otherAuthenticationUseCase: sl()));
  sl.registerFactory<SetPasswordBloc>(() => SetPasswordBloc(setPasswordUseCase: sl()));
  sl.registerFactory<VerificationCodeBloc>(() => VerificationCodeBloc(verificationCodeUseCase: sl()));
  sl.registerFactory<ForgotPasswordBloc>(() => ForgotPasswordBloc(forgotPasswordUseCase: sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(loginUseCase: sl() , localDataSource: sl()));
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(registerUseCase: sl()));
  // use cases
  sl.registerLazySingleton<OtherAuthenticationUseCase>(() => OtherAuthenticationUseCase(domainRepository: sl()));
  sl.registerLazySingleton<SetPasswordUseCase>(() => SetPasswordUseCase(domainRepository: sl()));
  sl.registerLazySingleton<VerifyUseCase>(() => VerifyUseCase(domainRepository: sl()));
  sl.registerLazySingleton<ForgetPasswordUseCase>(() => ForgetPasswordUseCase(domainRepository: sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(domainRepository: sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(domainRepository: sl()));

}