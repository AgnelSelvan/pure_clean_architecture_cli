import 'dart:io';

import 'package:pure_clean_architecture_cli/src/utils/constants.dart';

class AppUtils {
  static bool isValidFlutterProject() {
    final pubspecFile = File(AppConstants.pubspecYamlFile);
    return pubspecFile.existsSync();
  }
}
