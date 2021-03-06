import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Interface

abstract class HistoryRepository {
  Future<List<History>> loadHistories();
  Future<void> addHistory(History history);
}

// MARK: - Implementation

class HistoryRepositoryImpl extends HistoryRepository {
  Box<History> _historiesBox;

  Future<List<History>> loadHistories() async {
    // NOTE: Open hive box at first time.
    if (_historiesBox == null) {
      await Hive.initFlutter();
      final box = await Hive.openBox<History>(HiveBoxNames.history);
      _historiesBox = box;
    }

    final histories = _historiesBox.values.toList();
    return histories;
  }

  Future<void> addHistory(History history) async {
    // NOTE: Open hive box at first time.
    if (_historiesBox == null) {
      await Hive.initFlutter();
      final box = await Hive.openBox<History>(HiveBoxNames.history);
      _historiesBox = box;
    }

    return _historiesBox.add(history);
  }
}