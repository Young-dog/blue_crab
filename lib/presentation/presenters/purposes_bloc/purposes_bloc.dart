import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'purposes_event.dart';
part 'purposes_state.dart';

class PurposesBloc extends Bloc<PurposesEvent, PurposesState> {
  PurposesBloc() : super(PurposesInitial()) {
    on<PurposesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
