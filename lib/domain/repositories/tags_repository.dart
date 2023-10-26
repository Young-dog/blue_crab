import 'dart:ui';

import '../../data/data.dart';
import '../domain.dart';

abstract class TagsRepository {
  const TagsRepository();

  Future<void> addTag({
    required String title,
    required Color color,
  });

  Future<void> deleteTag({
    required int index,
  });

  Future<List<Tag>> initTags(

      );
}

class TagsRepositoryImpl implements TagsRepository {
  const TagsRepositoryImpl({
    required LocaleTagsDataSource localeTagsDataSource,
  }) : _localeTagsDataSource = localeTagsDataSource;

  final LocaleTagsDataSource _localeTagsDataSource;

  @override
  Future<void> addTag({
    required String title,
    required Color color,
  }) async {
    await _localeTagsDataSource.addTag(
      tag: Tag(
        title: title,
        color: color,
      ),
    );
  }

  @override
  Future<void> deleteTag({
    required int index,
  }) async {
    await _localeTagsDataSource.deleteTag(
      index: index,
    );
  }

  @override
  Future<List<Tag>> initTags() async {
    final tags = await _localeTagsDataSource.initTags();

    return tags;
  }
}
