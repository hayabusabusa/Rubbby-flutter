import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:rubbby/bloc/result/result.dart';
import 'package:rubbby/repository/repository.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final HistoryRepository _historyRepository;

  ResultBloc({
    @required HistoryRepository historyRepository,
  }): assert(historyRepository != null), 
      _historyRepository = historyRepository;

  // MARK: Private methods

  Stream<ResultState> _mapResultLoadHistoriesToState(ResultLoadHistories event) async* {
    await _historyRepository.addHistory(event.history);
    final histories = await _historyRepository.loadHistories();
    yield ResultHistoriesLoaded(histories);
  }

  // MARK: Override

  @override
  ResultState get initialState => ResultHistoriesLoading();

  @override
  Stream<ResultState> mapEventToState(ResultEvent event) async* {
    if (event is ResultLoadHistories) {
      yield* _mapResultLoadHistoriesToState(event);
    }
  }
}