import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'track_event.dart';

part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc() : super(TrackState.initial()) {
    on<ChangeSelectedDayEvent>(_onChangeSelectedDay);
    on<ChangeFocusedDayEvent>(_onChangeFocusedDay);
  }

  void _onChangeSelectedDay(
    ChangeSelectedDayEvent event,
    Emitter<TrackState> emit,
  ) {
    emit(
      state.copyWith(
        selectedDate: event.selectedDay,
      ),
    );
  }

  void _onChangeFocusedDay(
      ChangeFocusedDayEvent event,
      Emitter<TrackState> emit,
      ) {
    emit(
      state.copyWith(
        focusedDay: event.focusedDay,
      ),
    );
  }
}
