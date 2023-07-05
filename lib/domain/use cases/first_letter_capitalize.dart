class ToUpperCase {
  
  static String toCapCase({required String text}) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }
}
