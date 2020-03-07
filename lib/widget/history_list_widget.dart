import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rubbby/bloc/blocs.dart';
import 'package:rubbby/widget/widget.dart';

// MARK: - Widget

class HistoryListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryListWidgetState();
}

// MARK: - State

class _HistoryListWidgetState extends State<HistoryListWidget> {
  HistoryBloc _historyBloc;

  // MARK: Private

  Widget _mapHistoryLoadingToWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _mapHistoryLoadedWidget(HistoryLoaded state) {
    return ListView.builder(
      itemCount: state.histories.length == null ? 0 : state.histories.length,
      itemBuilder: (context, index) => HistoryWidget(state.histories[index]),
    );
  }

  // MARK: Lifecycle

  @override
  void initState() {
    super.initState();
    _historyBloc = BlocProvider.of<HistoryBloc>(context);
    _historyBloc.add(LoadHistories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return _mapHistoryLoadingToWidget();
        } else if (state is HistoryLoaded) {
          return _mapHistoryLoadedWidget(state);
        } else {
          return SizedBox();
        }
      }
    );
  }
}