enum OutputType {
  hiragana,
  katakana
}

class OutputTypeHelper {
  static String mapToString(OutputType outputType) {
    switch (outputType) {
      case OutputType.hiragana: return 'hiragana';
      case OutputType.katakana: return 'katakana';
      default: return 'unknown';
    }
  }
}