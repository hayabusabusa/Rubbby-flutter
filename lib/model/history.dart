import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'history.g.dart';

@HiveType(typeId: 0)
class History {
  @HiveField(0)
  final DateTime dateTime;
  @HiveField(1)
  final String originalText;
  @HiveField(2)
  final String convertedText;

  const History({
    @required this.dateTime,
    @required this.originalText,
    @required this.convertedText,
  });
}