import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/core/presentation/blocs/userscaffold_blocs/events.dart';
import 'package:founderx/core/presentation/blocs/userscaffold_blocs/states.dart';
import 'package:founderx/features/dashboard/presentation/pages/dashboard.dart';

class UserScaffoldBloc extends Bloc<MovingEvent, MovingState>{
  UserScaffoldBloc() : super(MovingState(alignment: Alignment(-1, -0.95),svg: "assets/core/dashboard.svg", page: DashboardScreen())){
    on<MovingEvent>((event, emit) {
      emit(MovingState(alignment: event.alignment,svg: event.svg, page: event.page));
    });
  }
}