import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Interface

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

// MARK: - Event

class LoadHistories extends HistoryEvent {}

class AddHistory extends HistoryEvent {
  final History history;

  const AddHistory(this.history);

  @override
  List<Object> get props => [history];
}