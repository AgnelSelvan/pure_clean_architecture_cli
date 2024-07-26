extension StringHelper on String {
  String toSnakeCase() {
    String output = replaceAllMapped(RegExp(r'([A-Z])'), (match) {
      return '_${match.group(1)!.toLowerCase()}';
    });
    if (output.startsWith('_')) {
      output = output.substring(1);
    }
    return output;
  }

  String snakeToCamel() {
    // Split the input string by underscores
    List<String> words = split('_');

    // Capitalize the first letter of each subsequent word
    String camelCase = "";

    for (int i = 0; i < words.length; i++) {
      camelCase += words[i].capitalize(); // Capitalize subsequent words
    }

    return camelCase;
  }

  String snakeToCamelFirstLetterSmall() {
    final camelCase = snakeToCamel();
    return camelCase.replaceFirst(
        snakeToCamel()[0], snakeToCamel()[0].toLowerCase());
  }

  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
