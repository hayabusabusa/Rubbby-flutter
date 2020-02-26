import 'package:equatable/equatable.dart';
import 'package:rubbby/model/output_type.dart';

class Translation extends Equatable {
  final String converted;
  final OutputType outputType;

  const Translation({
    this.converted,
    this.outputType,
  });

  @override
  List<Object> get props => [
    converted,
    outputType,
  ];

  static Translation fromJson(Map<String, dynamic> json) {
    return Translation(
      converted: json['converted'],
      outputType: _mapStringToOutputType(json['output_type'])
    );
  }

  static OutputType _mapStringToOutputType(String input) {
    switch (input) {
      case 'hiragana': return OutputType.hiragana;
      case 'katakana': return OutputType.katakana;
      default: return OutputType.hiragana;
    }
  }
}