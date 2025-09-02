import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/events.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/states.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(DisabledButtonState()){
    on<EnableButtonEvent>(_enableButton);
    on<DisableButtonEvent>(_disableButton);
  }
  
  
  FutureOr<void> _enableButton(EnableButtonEvent event, Emitter<ButtonState> emit) {
    emit(EnabledButtonState());
  }

  FutureOr<void> _disableButton(DisableButtonEvent event, Emitter<ButtonState> emit) {
    emit(DisabledButtonState());
  }
}
class SelectedContainerBloc extends Bloc<SelectedEvent, SelectedContainerState> {
  SelectedContainerBloc() : super(Unselected(choosenContainerField: "")) {
    on<SelectContainerEvent>(_selectContainer);
    on<UnselectContainerEvent>(_unselectContainer);
  }

  FutureOr<void> _selectContainer(SelectContainerEvent event, Emitter<SelectedContainerState> emit) {
    emit(Selected(choosenContainerField: event.choosenContainerField));
  }

  FutureOr<void> _unselectContainer(UnselectContainerEvent event, Emitter<SelectedContainerState> emit) {
    emit(Unselected(choosenContainerField: event.choosenContainerField));
  }
}