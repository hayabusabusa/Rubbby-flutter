import 'package:equatable/equatable.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Interface

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

// MARK: - Event

class LoadHistories extends HistoryEvent {}

class DeleteHistory extends HistoryEvent {
  final History history;

  const DeleteHistory(this.history);

  @override
  List<Object> get props => [history];
}