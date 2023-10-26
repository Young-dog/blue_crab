part of 'track_bloc.dart';

class TrackState extends Equatable {
  const TrackState({
    required this.focusedDay,
    required this.selectedDate,
  });

  final DateTime selectedDate;
  final DateTime focusedDay;

  TrackState.initial()
      : focusedDay = DateTime.now(),
        selectedDate = DateTime.now();

  TrackState copyWith({
    DateTime? selectedDate,
    DateTime? focusedDay,
  }) {
    return TrackState(
      selectedDate: selectedDate ?? this.selectedDate,
      focusedDay: focusedDay ?? this.focusedDay,
    );
  }

  @override
  List<Object?> get props => [
        selectedDate,
        focusedDay,
      ];
}
