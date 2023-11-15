import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../app/app.dart';

part 'completed_habit.g.dart';

@HiveType(typeId: HiveTypeId.repetitionHabit)
class CompletedHabit extends Equatable {
  const CompletedHabit({
    this.finishCountRepetition = 0,
    required this.date,
  });


  @HiveField(0)
  final int finishCountRepetition;

  @HiveField(1)
  final DateTime date;

  @override
  List<Object?> get props => [
        finishCountRepetition,
        date,
      ];
}
