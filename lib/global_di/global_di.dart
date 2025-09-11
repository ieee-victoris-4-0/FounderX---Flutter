import 'package:founderx/core/core_di/core_di.dart';

import '../features/auth/auth_di/auth_di.dart';

setupLocator(){
  coreDI();
  authDI();
}