class Utils {
  static String getFirstWord(String text) {
    int index = text.indexOf(' ');
    if (index > -1) { // Check if there is more than one word.
      return text.substring(0, index); // Extract first word.
    } else {
      return text; // Text is the first word itself.
    }
  }
}