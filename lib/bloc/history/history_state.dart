import 'package:equatable/equatable.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Interface

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

// MARK: - State

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<History> histories;

  const HistoryLoaded(this.histories);

  @override
  List<Object> get props => [histories];
}

class HistoryNotLoaded extends HistoryState {}