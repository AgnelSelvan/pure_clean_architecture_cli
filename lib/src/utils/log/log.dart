enum Logger {
  black("30"),
  red("31"),
  green("32"),
  yellow("33"),
  blue("34"),
  magenta("35"),
  cyan("36"),
  white("37");

  final String code;
  const Logger(this.code);

  void log(dynamic text) {
    String leading = "";
    if (this == Logger.red) {
      leading = "[✗] ";
    } else if (this == Logger.green) {
      leading = "[✓] ";
    } else if (this == Logger.yellow) {
      leading = "[!] ";
    }
    print('\x1B[${code}m$leading\x1B[0m$text');
  }
}
