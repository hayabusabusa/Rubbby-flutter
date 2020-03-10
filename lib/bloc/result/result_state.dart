import 'package:equatable/equatable.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Interface

abstract class ResultState extends Equatable {
  const ResultState();

  @override
  List<Object> get props => [];
}

// MARK: - State

class ResultHistoriesLoading extends ResultState {}

class ResultHistoriesLoaded extends ResultState {
  final List<History> histories;

  const ResultHistoriesLoaded(this.histories);

  @override
  List<Object> get props => [histories];
}

class ResultHistoriesNotLoaded extends ResultState {}