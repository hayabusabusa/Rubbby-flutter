import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rubbby/bloc/blocs.dart';
import 'package:rubbby/model/model.dart';
import 'package:rubbby/widget/widget.dart';

// MARK: - Widget

class ResultListWidget extends StatefulWidget {
  final String originalText;
  final Translation translation;

  ResultListWidget({
    Key key,
    @required this.originalText,
    @required this.translation,
  }): assert(originalText != null, translation != null), 
      super(key: key);

  @override
  State<StatefulWidget> createState() => _ResultListWidgetState();
}

// MARK: - State

class _ResultListWidgetState extends State<ResultListWidget> {
  ResultBloc _resultBloc;

  // MARK: Private method

  Widget _mapResultHistoriesLoadingToWidget(ResultHistoriesLoading state) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _mapResultHistoriesLoadedToWidget(ResultHistoriesLoaded state) {
    return CustomScrollView(
      slivers: <Widget>[
        // Output
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ResultOutputWidget(convertedText: widget.translation.converted, originalText: widget.originalText),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('変換履歴'),
                ),
              ]
            )
          ]),
        ),
        // Histories
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return HistoryWidget(state.histories[index]);
            },
            childCount: state.histories.length == null ? 0 : state.histories.length
          ),
        ),
      ],
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
      }
    );
  }
}