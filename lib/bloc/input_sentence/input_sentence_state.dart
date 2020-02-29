import 'package:equatable/equatable.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Interface

abstract class InputSentenceState extends Equatable {
  const InputSentenceState();

  @override
  List<Object> get props => null;
}

// MARK: - State

class InputSentenceEditing extends InputSentenceState {
  final String sentence;
  final OutputType outputType;

  const InputSentenceEditing(
    this.sentence,
    this.outputType,
  );

  @override
  List<Object> get props => [sentence, outputType];
}

class InputSentencePosting extends InputSentenceState {
  final String sentence;
  final OutputType outputType;
  
  const InputSentencePosting(
    this.sentence,
    this.outputType,
  );

  @override
  List<Object> get props => [sentence, outputType];
}

class InputSentencePosted extends InputSentenceState {
  final Translation translation;

  const InputSentencePosted(
    this.translation
  );

  @override
  List<Object> get props => [translation];
}