import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/features/settings/presentation/blocs/events.dart';
import 'package:founderx/features/settings/presentation/blocs/states.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState(value: false)) {
    on<SwitchEvent>((event, emit) {
      emit(SwitchState(value: event.value));
    });
  }}