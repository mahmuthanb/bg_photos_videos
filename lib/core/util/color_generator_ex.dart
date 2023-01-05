class Formatter {
  int bgColor(String value) {
    return int.parse("0xFF${value.replaceAll("#", "")}");
  }
}
