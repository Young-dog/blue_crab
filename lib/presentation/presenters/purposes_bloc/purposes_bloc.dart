

import 'package:flutter_bloc/flutter_bloc.dart';

part 'purposes_event.dart';
part 'purposes_state.dart';

class PurposesBloc extends Bloc<PurposesEvent, PurposesState> {
  PurposesBloc() : super(PurposesInitial()) {
    on<PurposesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
