import 'package:equatable/equatable.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Interface

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

// MARK: - Event

/// 初回ロード時には最新のものを追加した状態のものをロードしたいため
/// 引数に`History`を持たせる.
class ResultLoadHistories extends ResultEvent {
  final History history;

  const ResultLoadHistories(this.history);

  @override
  List<Object> get props => [history];
}