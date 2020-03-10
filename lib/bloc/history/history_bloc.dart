import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:rubbby/bloc/blocs.dart';
import 'package:rubbby/repository/repository.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository _historyRepository;

  HistoryBloc({
    @required HistoryRepository historyRepository,
  }): assert(historyRepository != null),
      _historyRepository = historyRepository;

  // MARK: Private

  Stream<HistoryState> _mapHistoryLoadHistories() async* {
    final histories = await _historyRepository.loadHistories();
    yield HistoryLoaded(histories);
  }

  // MARK: Override

  @override
  HistoryState get initialState => HistoryLoading();

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is LoadHistories) {
      yield* _mapHistoryLoadHistories();
    }
  }
}