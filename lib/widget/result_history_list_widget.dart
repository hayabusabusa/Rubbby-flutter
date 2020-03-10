import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rubbby/bloc/blocs.dart';
import 'package:rubbby/model/model.dart';
import 'package:rubbby/widget/widget.dart';

// MARK: - Widget

class ResultHistoryListWidget extends StatefulWidget {
  final String originalText;
  final Translation translation;

  ResultHistoryListWidget({
    Key key,
    @required this.originalText,
    @required this.translation,
  }): assert(originalText != null, translation != null), 
      super(key: key);

  @override
  State<StatefulWidget> createState() => _ResultHistoryListWidgetState();
}

// MARK: - State

class _ResultHistoryListWidgetState extends State<ResultHistoryListWidget> {
  ResultBloc _resultBloc;

  // MARK: Private method

  Widget _mapResultHistoriesLoadingToWidget(ResultHistoriesLoading state) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _mapResultHistoriesLoadedToWidget(ResultHistoriesLoaded state) {
    return state.histories.length == null 
      ? Center(
        child: Text('履歴はありません'),
      ) 
      : ListView.separated(
        itemCount: state.histories.length,
        itemBuilder: (context, index) => HistoryWidget(state.histories[index]),
        separatorBuilder: (context, index) => SizedBox(height: 8,),
      );
  }

  Widget _mapResultHistoriesNotLoadedToWidget(ResultHistoriesNotLoaded state) {
    return Center(
      child: Text('エラーが発生しました'),
    );
  }

  // MARK: Lifecycle

  @override
  void initState() {
    super.initState();
    _resultBloc = BlocProvider.of<ResultBloc>(context);
    _resultBloc.add(ResultLoadHistories(History(dateTime: DateTime.now(), originalText: widget.originalText, convertedText: widget.translation.converted)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        // NOTE: Loading histories
        if (state is ResultHistoriesLoading) {
          return _mapResultHistoriesLoadingToWidget(state);
        // NOTE: Successed loading histories
        } else if (state is ResultHistoriesLoaded) {
          return _mapResultHistoriesLoadedToWidget(state);
        // NOTE: Failed loading histories
        } else {
          return _mapResultHistoriesNotLoadedToWidget(state);
        }
      },
    );
  }
}