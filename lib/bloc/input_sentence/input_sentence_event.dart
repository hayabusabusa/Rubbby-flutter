import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:rubbby/model/model.dart';

// MARK: - Interface

abstract class InputSentenceEvent extends Equatable {
  const InputSentenceEvent();
}

// MARK: - Events

class InputTextFieldEdited extends InputSentenceEvent {
  final String text;

  const InputTextFieldEdited({
    @required this.text
  });

  @override
  List<Object> get props => [text];
}

class DropdownMenuItemChanged extends InputSentenceEvent {
  final OutputType outputType;

  const DropdownMenuItemChanged({
    @required this.outputType
  });

  @override
  List<Object> get props => [outputType];
}

class TranslationButtonPressed extends InputSentenceEvent {
  const TranslationButtonPressed();

  @override
  List<Object> get props => [];
}