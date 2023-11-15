import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/data.dart';
import '../domain.dart';

abstract class PurposesRepository {
  const PurposesRepository();

  List<Purpose> get purposes;

  Stream<List<Purpose>> get purposesChanges;

  Future<void> addPurpose({
    required Purpose? previousPurpose,
    required String title,
    required String description,
    required Tag? tag,
    required Priority? priority,
    required DateTime? dateStart,
    required DateTime? dateEnd,
    required TimeOfDay? timeStart,
    required TimeOfDay? timeEnd,
  });

  Future<void> delPurpose({
    required Purpose purpose,
  });
}

class PurposesRepositoryImpl implements PurposesRepository, Disposable {
  PurposesRepositoryImpl._internal({
    required LocalePurposeDataSource localePurposeDataSource,
    required List<Purpose> purposes,
  })  : _purposes = purposes,
        _localePurposeDataSource = localePurposeDataSource,
        _purposesController = StreamController<List<Purpose>>.broadcast();

  static Future<PurposesRepositoryImpl> create({
    required LocalePurposeDataSource localePurposeDataSource,
  }) async {
    final purposes = await localePurposeDataSource.getPurposes();

    final purposesRepositoryImpl = PurposesRepositoryImpl._internal(
      localePurposeDataSource: localePurposeDataSource,
      purposes: purposes,
    );

    return purposesRepositoryImpl;
  }

  List<Purpose> _purposes;

  final StreamController<List<Purpose>> _purposesController;

  final LocalePurposeDataSource _localePurposeDataSource;

  @override
  Future<void> addPurpose({
    required Purpose? previousPurpose,
    required String title,
    required String description,
    required Tag? tag,
    required Priority? priority,
    required DateTime? dateStart,
    required DateTime? dateEnd,
    required TimeOfDay? timeStart,
    required TimeOfDay? timeEnd,
  }) async {
    final currentPurpose = Purpose(
      title: title,
      description: description,
      tag: tag,
      priority: priority,
      dateStart: dateStart,
      dateEnd: dateEnd,
      timeStart: timeStart,
      timeEnd: timeEnd,
    );

    await _localePurposeDataSource.addPurpose(
      previousPurpose: previousPurpose,
      currentPurpose: currentPurpose,
    );

    await _getPurposes();
  }

  @override
  Future<void> delPurpose({required Purpose purpose}) async {
    await _localePurposeDataSource.delPurpose(
      purpose: purpose,
    );
    await _getPurposes();
  }

  @override
  List<Purpose> get purposes => _purposes;

  @override
  Stream<List<Purpose>> get purposesChanges => _purposesController.stream;

  @override
  FutureOr onDispose() {
    _purposesController.close();
  }

  Future<void> _getPurposes() async {
    _purposes = await _localePurposeDataSource.getPurposes();

    _purposesController.add(_purposes);
  }
}
