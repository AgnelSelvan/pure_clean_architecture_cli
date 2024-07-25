import 'dart:io';

import 'package:pure_clean_architecture_cli/pure_clean_architecture_cli.dart'
    as pure_clean_architecture_cli;

void main(List<String> arguments) {
  stdout.write("Enter Feature name : ");
  final featureName = stdin.readLineSync();
  if (featureName == null || featureName.isEmpty) {
    print("Feature name is required");
    exit(1);
  }
  pure_clean_architecture_cli.createFeature(featureName.toLowerCase());
}
