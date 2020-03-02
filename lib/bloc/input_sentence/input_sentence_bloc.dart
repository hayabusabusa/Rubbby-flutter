import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:rubbby/bloc/input_sentence/input_sentence.dart';
import 'package:rubbby/model/model.dart';
import 'package:rubbby/repository/repository.dart';

class InputSentenceBloc extends Bloc<InputSentenceEvent, InputSentenceState> {
  final HiraganaTranslationRepository _hiraganaTranslationRepository;

  InputSentenceBloc({
    @required HiraganaTranslationRepository hiraganaTranslationRepository
  }): assert(hiraganaTranslationRepository != null),
      _hiraganaTranslationRepository = hiraganaTranslationRepository;

  // MARK: Private methods

  Stream<InputSentenceState> _mapInputTextFieldEditedToState(InputTextFieldEdited event) async* {
    final currentState = state;
    if (currentState is InputSentenceEditing) {
      yield InputSentenceEditing(event.text, currentState.outputType);
    }
  }

  Stream<InputSentenceState> _mapDropdownMenuItemChangedToState(DropdownMenuItemChanged event) async* {
    final currentState = state;
    if (currentState is InputSentenceEditing) {
      yield InputSentenceEditing(currentState.sentence, event.outputType);
    }
  }

  Stream<InputSentenceState> _mapTranslationButtonPressedToState(TranslationButtonPressed event) async* {
    final currentState = state;
    if (currentState is InputSentenceEditing) {
      yield InputSentencePosting(currentState.sentence, currentState.outputType);

      try {
        final Translation translation = await _hiraganaTranslationRepository.postSentence(currentState.sentence, currentState.outputType);
        yield InputSentencePosted(currentState.sentence, translation);
        yield InputSentenceEditing(currentState.sentence, currentState.outputType);
      } catch (_) {
        yield InputSentencePostingError();
        yield InputSentenceEditing(currentState.sentence, currentState.outputType);
      } 
    }
  }

  // MARK: Overrides

  @override
  InputSentenceState get initialState => InputSentenceEditing('', OutputType.hiragana);

  @override
  Stream<InputSentenceState> mapEventToState(InputSentenceEvent event) async* {
    // NOTE: InputTextField edited
    if (event is InputTextFieldEdited) {
      yield* _mapInputTextFieldEditedToState(event);
    }
    // NOTE: DropdownMenuItem changed
    if (event is DropdownMenuItemChanged) {
      yield* _mapDropdownMenuItemChangedToState(event);
    }
    // NOTE: TranslationButton pressed
    if (event is TranslationButtonPressed) {
      yield* _mapTranslationButtonPressedToState(event);
    }
  }
}