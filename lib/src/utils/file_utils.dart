import 'dart:io';

class FileUtils {
  static Directory getDirectory(String directoryPath) {
    final featureDirectory = Directory(directoryPath);
    return featureDirectory;
  }

  static File getFile(String filePath) {
    final file = File(filePath);
    return file;
  }

  static void createDirectory(String directoryPath) {
    final featureDirectory = getDirectory(directoryPath);
    featureDirectory.createSync(recursive: true);
  }

  static void createFile(String filePath) {
    final file = getFile(filePath);
    file.createSync(recursive: true);
  }

  static void writeFile(File file, String content) {
    file.writeAsStringSync(content);
  }
}
