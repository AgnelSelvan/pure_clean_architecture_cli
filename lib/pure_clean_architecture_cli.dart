import 'dart:io';

import 'package:pure_clean_architecture_cli/extensions/string.dart';
import 'package:pure_clean_architecture_cli/src/create_new_feature.dart';
import 'package:pure_clean_architecture_cli/src/setup_project.dart';
import 'package:pure_clean_architecture_cli/src/utils/log/log.dart';

void initialize() {
  // Check if this is a valid flutter project
//   if (!AppUtils.isValidFlutterProject()) {
//     Logger.red.log('This is not a valid Flutter project');
//     exit(1);
//   }
  // Display options to the user
  stdout.write("Please select an option: \n");
  stdout.write("1. Setup A Project\n");
  stdout.write("2. Create a new feature\n");
  stdout.write("3. Create a new feature based on freezed\n");
  stdout.write("Please select an option: ");
  final input = stdin.readLineSync();
  if (input == null || input.isEmpty) {
    Logger.red.log("Option is required");
    exit(1);
  }
  if (input == '1') {
    setupProject();
  } else if (input == '2') {
    stdout.write("Enter Feature name : ");
    final inputFeatureName = stdin.readLineSync();
    if (inputFeatureName == null || inputFeatureName.isEmpty) {
      Logger.red.log("Feature name is required");
      exit(1);
    }
    final featureName = inputFeatureName.toSnakeCase();
    createNewFeature(featureName, false);
  } else if (input == '3') {
    stdout.write("Enter Feature name : ");
    final inputFeatureName = stdin.readLineSync();
    if (inputFeatureName == null || inputFeatureName.isEmpty) {
      Logger.red.log("Feature name is required");
      exit(1);
    }
    final featureName = inputFeatureName.toSnakeCase();
    createNewFeature(featureName, true);
  } else {
    Logger.red.log("Invalid option");
    exit(1);
  }
}
