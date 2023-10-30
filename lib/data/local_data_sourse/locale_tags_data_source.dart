import 'package:hive_flutter/hive_flutter.dart';

import '../../app/app.dart';
import '../../domain/domain.dart';

abstract class LocaleTagsDataSource {
  const LocaleTagsDataSource();

  Future<void> addTag({
    required Tag tag,
  });

  Future<void> deleteTag({required int index});

  Future<List<Tag>> initTags();
}

class LocaleTagsDataSourceImpl extends LocaleTagsDataSource {
  const LocaleTagsDataSourceImpl._internal({
    required Box<Tag> tagsBox,
  }) : _tagsBox = tagsBox;

  final Box<Tag> _tagsBox;

  static Future<LocaleTagsDataSourceImpl> create({
    required HiveInterface hive,
  }) async {
    final tagsBox = await hive.openBox<Tag>(
      HiveBoxes.tagBox,
    );

    final localeTagDataSource = LocaleTagsDataSourceImpl._internal(
      tagsBox: tagsBox,
    );

    return localeTagDataSource;
  }

  @override
  Future<void> addTag({
    required Tag tag,
  }) async {
    await _tagsBox.add(
      tag,
    );
  }

  @override
  Future<void> deleteTag({
    required int index,
  }) async {
    await _tagsBox.deleteAt(
      index,
    );
  }

  @override
  Future<List<Tag>> initTags() async {
    final tags = _tagsBox.values.toList();

    return tags;
  }
}
