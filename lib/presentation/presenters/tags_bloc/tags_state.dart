part of 'tags_bloc.dart';

class TagsState extends Equatable {
  const TagsState({
    required this.title,
    required this.color,
  });

  const TagsState.initial()
      : title = '',
        color = const Color(0xFF80b918);

  final String title;
  final Color color;

  TagsState copyWith({
    String? title,
    Color? color,
    List<Tag>? tags,
  }) {
    return TagsState(
      title: title ?? this.title,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [
        title,
        color,
      ];
}
