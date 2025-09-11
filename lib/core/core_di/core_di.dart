import 'package:founderx/core/Api/api_client.dart';
import 'package:founderx/core/network_info/check_connection.dart';
import 'package:founderx/core/presentation/blocs/userscaffold_blocs/blocs.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl=GetIt.instance;
coreDI() async{
  // api client
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  // check connection
  sl.registerLazySingleton<CheckConnection>(() => CheckConnection(internetConnectionChecker: sl()));
  // externalPakages
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker.createInstance());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // blocs
  sl.registerFactory<UserScaffoldBloc>(() => UserScaffoldBloc());
}
