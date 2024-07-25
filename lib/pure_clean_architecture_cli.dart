import 'dart:io';

bool _checkIfFeatureExists(String featureName) {
  final featureDirectory = Directory('lib/features/$featureName');
  return featureDirectory.existsSync();
}

bool _isValidFlutterProject() {
  final pubspecFile = File('pubspec.yaml');
  return pubspecFile.existsSync();
}

void createFeature(String featureName) {
  if (!_isValidFlutterProject()) {
    print('This is not a valid Flutter project');
    exit(1);
  }
  if (_checkIfFeatureExists(featureName)) {
    print('Feature already exists');
    exit(1);
  }

  const baseDirectory = 'lib/features';

  final featureDirectory = Directory('$baseDirectory/$featureName');
  featureDirectory.createSync(recursive: true);
  final featureFile = File('$baseDirectory/$featureName/$featureName.dart');
  featureFile.createSync();
}
