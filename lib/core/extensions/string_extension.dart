extension StringExtension on String {
  /// Permet de mettre la 1ère lettre en majuscule
  /// ```dart
  /// String text = "hello world";
  /// print(text.ucFirst());
  /// // "Hello world"
  /// ```
  String ucFirst() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
