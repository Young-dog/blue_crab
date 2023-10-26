import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/domain.dart';

part 'tags_event.dart';

part 'tags_state.dart';

class TagsBloc extends Bloc<TagsEvent, TagsState> {
  TagsBloc({
    required TagsRepository tagsRepository,
  })  : _tagsRepository = tagsRepository,
        super(const TagsState.initial()) {
    on<TagChangeTitleEvent>(_onChangeTitleTag);
    on<TagChangeColorEvent>(_onChangeColorTag);
    on<TagAddEvent>(_onAddTag);
    on<TagDelEvent>(_onDelTag);
  }

  final TagsRepository _tagsRepository;

  void _onChangeTitleTag(
    TagChangeTitleEvent event,
    Emitter<TagsState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );
  }

  void _onChangeColorTag(
    TagChangeColorEvent event,
    Emitter<TagsState> emit,
  ) {
    emit(
      state.copyWith(
        color: event.color,
      ),
    );
  }

  Future<void> _onAddTag(
    TagAddEvent event,
    Emitter<TagsState> emit,
  ) async {
    if (state.title.isEmpty) {
      return;
    }

    await _tagsRepository.addTag(
      title: state.title,
      color: state.color,
    );

    emit(
      state.copyWith(
        title: '',
      ),
    );
  }

  Future<void> _onDelTag(
    TagDelEvent event,
    Emitter<TagsState> emit,
  ) async {
    await _tagsRepository.deleteTag(
      index: event.index,
    );
  }
}
