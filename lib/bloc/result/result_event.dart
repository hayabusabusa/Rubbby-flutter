import 'package:equatable/equatable.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Interface

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

// MARK: - Event

class ResultLoadHistories extends ResultEvent {}

class ResultAddHistory extends ResultEvent {
  final History history;

  const ResultAddHistory(this.history);

  @override
  List<Object> get props => [history];
}