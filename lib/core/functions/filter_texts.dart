abstract class FilterTexts {
  static String getText({
    required String text,
  }) {
    final regex = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
    return text.replaceAll(regex, '').trim();
  }
}
