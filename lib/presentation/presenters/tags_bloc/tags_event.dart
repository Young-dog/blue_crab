part of 'tags_bloc.dart';

abstract class TagsEvent extends Equatable {
  const TagsEvent();

  @override
  List<Object?> get props => [];
}

class TagAddEvent extends TagsEvent {
  const TagAddEvent();
}

class TagDelEvent extends TagsEvent {
  const TagDelEvent({required this.index,});

  final int index;

  @override
  List<Object?> get props => [
    index,
  ];
}

class TagChangeTitleEvent extends TagsEvent {
  const TagChangeTitleEvent({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [
        title,
      ];
}

class TagChangeColorEvent extends TagsEvent {
  const TagChangeColorEvent({
    required this.color,
  });

  final Color color;

  @override
  List<Object?> get props => [
        color,
      ];
}
