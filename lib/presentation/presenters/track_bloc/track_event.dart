part of 'track_bloc.dart';

abstract class TrackEvent extends Equatable {
  const TrackEvent();
}

class ChangeSelectedDayEvent extends TrackEvent {
  const ChangeSelectedDayEvent({
    required this.selectedDay,
  });

  final DateTime selectedDay;

  @override
  List<Object?> get props => [
        selectedDay,
      ];
}

class ChangeFocusedDayEvent extends TrackEvent {
  const ChangeFocusedDayEvent({
    required this.focusedDay,
  });

  final DateTime focusedDay;

  @override
  List<Object?> get props => [
    focusedDay,
  ];
}
