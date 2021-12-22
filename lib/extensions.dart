// https://dart.dev/guides/language/extension-methods

extension StringExtension on String {
  bool hasPrefix(String subst) {
    return startsWith(subst);
  }

  bool hasSuffix(String subst) {
    return endsWith(subst);
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
