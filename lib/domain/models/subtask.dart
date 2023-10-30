import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../app/app.dart';

part 'subtask.g.dart';

@HiveType(
  typeId: HiveTypeId.subtask,
)
class Subtask extends Equatable {
  const Subtask({
    required this.finish,
    required this.title,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final bool finish;

  Subtask copyWith({
    String? title,
    bool? finish,
  }) {
    return Subtask(
      title: title ?? this.title,
      finish: finish ?? this.finish,
    );
  }

  @override
  List<Object?> get props => [
        title,
        finish,
      ];
}
