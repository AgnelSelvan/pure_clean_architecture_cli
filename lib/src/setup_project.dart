import 'dart:io';

import 'package:pure_clean_architecture_cli/src/content/file_content.dart';
import 'package:pure_clean_architecture_cli/src/create_new_feature.dart';
import 'package:pure_clean_architecture_cli/src/utils/file_utils.dart';
import 'package:pure_clean_architecture_cli/src/utils/files.dart';
import 'package:pure_clean_architecture_cli/src/utils/log/log.dart';
import 'package:pure_clean_architecture_cli/src/utils/utils.dart';

void _createFiles() {
  FileUtils.createFile(coreAPIFile);
  FileUtils.createFile(coreAssetsFile);
  FileUtils.createFile(coreThemesFile);
  FileUtils.createFile(coreConstantsFile);
  FileUtils.createFile(coreFailureFile);
  FileUtils.createFile(coreExceptionFile);
  FileUtils.createFile(coreExtensionFile);
  FileUtils.createFile(coreUsecaseFile);
  FileUtils.createFile(coreRoutesFile);
  FileUtils.createFile(coreValidatorFile);
}

void _writeFiles(String packageName) {
  FileUtils.writeFile(
    FileUtils.getFile(coreFailureFile),
    getFailureFileContent(),
  );
  FileUtils.writeFile(
    FileUtils.getFile(coreExceptionFile),
    getExceptionFileContent(),
  );
  print("packageName: $packageName $packageName");
  FileUtils.writeFile(
    FileUtils.getFile(coreUsecaseFile),
    getUtilsUsecaseFileContent(packageName),
  );
}

void setupProject() async {
  if (!AppUtils.isValidFlutterProject()) {
    Logger.red.log('This is not a valid Flutter project');
    exit(1);
  }
  Logger.blue.log("Setting up project...");
  _createFiles();
  _writeFiles(getPackageName());
  Logger.magenta.log("Running flutter pub get...");
  await Process.run('flutter', ['pub', 'add', 'bloc']);
  await Process.run('flutter', ['pub', 'add', 'equatable']);
  await Process.run('flutter', ['pub', 'add', 'dartz']);
  Process.run("flutter", ['pub', 'get']).then((ProcessResult results) {
    Logger.green.log("Project setup completed successfully");
  });
}
