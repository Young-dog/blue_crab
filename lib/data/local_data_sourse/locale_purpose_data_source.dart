import 'package:hive_flutter/hive_flutter.dart';

import '../../app/hive_boxes.dart';
import '../../domain/domain.dart';

abstract class LocalePurposeDataSource {
  const LocalePurposeDataSource();

  Future<void> addPurpose({
    required Purpose? previousPurpose,
    required Purpose currentPurpose,
  });

  Future<void> delPurpose({
    required Purpose purpose,
  });

  Future<List<Purpose>> getPurposes();
}

class LocalePurposeDataSourceImpl implements LocalePurposeDataSource {
  const LocalePurposeDataSourceImpl._internal({
    required Box<Purpose> purposesBox,
  }) : _purposesBox = purposesBox;

  static Future<LocalePurposeDataSourceImpl> create({
    required HiveInterface hive,
  }) async {
    final purposesBox = await hive.openBox<Purpose>(
      HiveBoxes.purposesBox,
    );

    final localePurposeDataSourceImpl = LocalePurposeDataSourceImpl._internal(
      purposesBox: purposesBox,
    );

    return localePurposeDataSourceImpl;
  }

  final Box<Purpose> _purposesBox;

  @override
  Future<void> addPurpose({
    required Purpose? previousPurpose,
    required Purpose currentPurpose,
  }) async {
    if (previousPurpose != null &&
        _purposesBox.values.contains(previousPurpose)) {
      final index = _purposesBox.values.toList().indexOf(previousPurpose);

      await _purposesBox.putAt(
        index,
        currentPurpose,
      );
    } else {
      await _purposesBox.add(
        currentPurpose,
      );
    }
  }

  @override
  Future<void> delPurpose({
    required Purpose purpose,
  }) async {
    final index = _purposesBox.values.toList().indexOf(purpose);

    await _purposesBox.deleteAt(index);
  }

  @override
  Future<List<Purpose>> getPurposes() async {
    final purposes = _purposesBox.values.toList();

    return purposes;
  }
}
