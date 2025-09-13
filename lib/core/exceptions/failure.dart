import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure({required this.message});
  @override
  List<Object?> get props => [message];
}
class ServerFailure extends Failure{
  const ServerFailure({required super.message});
  @override
  List<Object?> get props => [message];
}
class OtherLoginCancelFailure extends Failure{
  const OtherLoginCancelFailure({required super.message});
  @override
  List<Object?> get props => [message];
}
class SharedPreferenceFailure extends Failure{
  const SharedPreferenceFailure({required super.message});
  @override
  List<Object?> get props => [message];
}
class NetworkFailure extends Failure{
  const NetworkFailure({required super.message});
  @override
  List<Object?> get props => [message];
}
class UserAlreadyFoundFailure extends Failure{
  const UserAlreadyFoundFailure({required super.message});
  @override
  List<Object?> get props => [message];
}
class InvalidCredentialsFailure extends Failure{
  const InvalidCredentialsFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

