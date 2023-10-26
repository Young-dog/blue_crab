import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../app/app.dart';

part 'tag.g.dart';

@HiveType(typeId: HiveTypeId.tag)
class Tag extends Equatable {
  const Tag({
    required this.title,
    required this.color,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final Color color;

  @override
  List<Object?> get props => [
        title,
        color,
      ];
}
