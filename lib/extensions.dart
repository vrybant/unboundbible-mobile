// https://dart.dev/guides/language/extension-methods

extension StringExtension on String {
  bool iEmpty() {
    return isEmpty;
  }

  bool hasPrefix(String substr) {
    return startsWith(substr);
  }

  bool hasSuffix(String substr) {
    return endsWith(substr);
  }

  String removeTags() {
    String s = '';
    bool l = true;

    split('').forEach((c) {
      if (c == '<') l = false;
      if (l) s += c;
      if (c == '>') l = true;
    });

    return s;
  }
}
