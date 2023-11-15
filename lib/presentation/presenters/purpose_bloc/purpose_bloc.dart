import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'purpose_event.dart';
part 'purpose_state.dart';

class PurposeBloc extends Bloc<PurposeEvent, PurposeState> {
  PurposeBloc() : super(PurposeInitial()) {
    on<PurposeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
