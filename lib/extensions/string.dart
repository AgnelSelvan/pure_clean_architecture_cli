extension StringHelper on String {
  String toSnakeCase() {
    print("this: $this");
    String output = replaceAllMapped(RegExp(r'([A-Z])'), (match) {
      return '_${match.group(1)!.toLowerCase()}';
    });
    // Remove leading underscore if present
    if (output.startsWith('_')) {
      output = output.substring(1);
    }
    print("output: $output");
    return output;
  }
}
