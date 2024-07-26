import 'dart:io';

import 'package:pure_clean_architecture_cli/extensions/string.dart';

const baseDirectory = 'lib/features';

String featureNameUpperCase(String featureName) =>
    featureName[0].toUpperCase() + featureName.substring(1);

String featureDir(String featureName) => '$baseDirectory/$featureName';

// Clean Architecture Directories
String featureDataDir(String featureName) => '$baseDirectory/$featureName/data';
String featureDomainDir(String featureName) =>
    '$baseDirectory/$featureName/domain';
String featurePresentationDir(String featureName) =>
    '$baseDirectory/$featureName/presentation';

// Data Layer
String featureDataSourceDir(String featureName) =>
    '${featureDataDir(featureName)}/datasource';
String featureDataRepositoryDir(String featureName) =>
    '${featureDataDir(featureName)}/repository';
String featureDataModelDir(String featureName) =>
    '${featureDataDir(featureName)}/models';

// Domain Layer
String featureDomainUseCaseDir(String featureName) =>
    '${featureDomainDir(featureName)}/usecase';
String featureDomainEntityDir(String featureName) =>
    '${featureDomainDir(featureName)}/entity';
String featureDomainRepositoryDir(String featureName) =>
    '${featureDomainDir(featureName)}/repository';

// Presentation Layer
String featurePresentationManagerDir(String featureName) =>
    '${featurePresentationDir(featureName)}/manager';
String featurePresentationPageDir(String featureName) =>
    '${featurePresentationDir(featureName)}/pages';
String featurePresentationWidgetDir(String featureName) =>
    '${featurePresentationDir(featureName)}/widgets';

//Data Layer Files
String localDSFile(String featureName) =>
    '${featureDataSourceDir(featureName)}/${featureName}_local_datasource.dart';
String remoteDSFile(String featureName) =>
    '${featureDataSourceDir(featureName)}/${featureName}_remote_datasource.dart';
String dataRepositoryFile(String featureName) =>
    '${featureDataRepositoryDir(featureName)}/${featureName}_repository.dart';
String modelFile(String featureName) =>
    '${featureDataModelDir(featureName)}/${featureName}_model.dart';

//Domain Layer Files
String entityFile(String featureName) =>
    '${featureDomainEntityDir(featureName)}/${featureName}_entity.dart';
String domainRepositoryFile(String featureName) =>
    '${featureDomainRepositoryDir(featureName)}/${featureName}_repository.dart';
String addUseCaseFile(String featureName) =>
    '${featureDomainUseCaseDir(featureName)}/add_${featureName}_usecase.dart';
String updateUseCaseFile(String featureName) =>
    '${featureDomainUseCaseDir(featureName)}/update_${featureName}_usecase.dart';
String deleteUseCaseFile(String featureName) =>
    '${featureDomainUseCaseDir(featureName)}/delete_${featureName}_usecase.dart';
String getUseCaseFile(String featureName) =>
    '${featureDomainUseCaseDir(featureName)}/get_${featureName}_usecase.dart';

//Presentation Layer Files
String managerBlocFile(String featureName) =>
    '${featurePresentationManagerDir(featureName)}/${featureName}_bloc.dart';
String managerEventFile(String featureName) =>
    '${featurePresentationManagerDir(featureName)}/${featureName}_event.dart';
String managerStateFile(String featureName) =>
    '${featurePresentationManagerDir(featureName)}/${featureName}_state.dart';
String pageFile(String featureName) =>
    '${featurePresentationPageDir(featureName)}/${featureName}_page.dart';

bool _checkIfFeatureExists(String featureName) {
  final featureDirectory = Directory(featureDir(featureName));
  return featureDirectory.existsSync();
}

bool _isValidFlutterProject() {
  final pubspecFile = File('pubspec.yaml');
  return pubspecFile.existsSync();
}

void request() {
  if (!_isValidFlutterProject()) {
    print('This is not a valid Flutter project');
    exit(1);
  }
  stdout.write("Enter Feature name : ");
  final inputFeatureName = stdin.readLineSync();
  if (inputFeatureName == null || inputFeatureName.isEmpty) {
    print("Feature name is required");
    exit(1);
  }
  final featureName = inputFeatureName.toSnakeCase();
  print("featureName: $featureName");
  if (_checkIfFeatureExists(featureName)) {
    print('Feature already exists');
    exit(1);
  }

  final featureDirectory = Directory(featureDir(featureName));
  featureDirectory.createSync(recursive: true);

  final dataDirectory = Directory(featureDataDir(featureName));
  dataDirectory.createSync(recursive: true);

  final domainDirectory = Directory(featureDomainDir(featureName));
  domainDirectory.createSync(recursive: true);

  final presentationDirectory = Directory(featurePresentationDir(featureName));
  presentationDirectory.createSync(recursive: true);

  final dataSourceDirectory = Directory(featureDataSourceDir(featureName));
  dataSourceDirectory.createSync(recursive: true);

  final dataRepositoryDirectory =
      Directory(featureDataRepositoryDir(featureName));
  dataRepositoryDirectory.createSync(recursive: true);

  final dataModelDirectory = Directory(featureDataModelDir(featureName));
  dataModelDirectory.createSync(recursive: true);

  final domainUseCaseDirectory =
      Directory(featureDomainUseCaseDir(featureName));
  domainUseCaseDirectory.createSync(recursive: true);

  final domainEntityDirectory = Directory(featureDomainEntityDir(featureName));
  domainEntityDirectory.createSync(recursive: true);

  final domainRepositoryDirectory =
      Directory(featureDomainRepositoryDir(featureName));
  domainRepositoryDirectory.createSync(recursive: true);

  final presentationManagerDirectory =
      Directory(featurePresentationManagerDir(featureName));
  presentationManagerDirectory.createSync(recursive: true);

  final presentationPageDirectory =
      Directory(featurePresentationPageDir(featureName));
  presentationPageDirectory.createSync(recursive: true);

  final presentationWidgetDirectory =
      Directory(featurePresentationWidgetDir(featureName));
  presentationWidgetDirectory.createSync(recursive: true);

  final localDS = File(localDSFile(featureName));
  localDS.createSync();

  final remoteDS = File(remoteDSFile(featureName));
  remoteDS.createSync();

  final dataRepository = File(dataRepositoryFile(featureName));
  dataRepository.createSync();

  final model = File(modelFile(featureName));
  print("model: ${model.path}");
  model.createSync();

  final entity = File(entityFile(featureName));
  entity.createSync();

  final domainRepository = File(domainRepositoryFile(featureName));
  domainRepository.createSync();

  final addUseCase = File(addUseCaseFile(featureName));
  addUseCase.createSync();

  final updateUseCase = File(updateUseCaseFile(featureName));
  updateUseCase.createSync();

  final deleteUseCase = File(deleteUseCaseFile(featureName));
  deleteUseCase.createSync();

  final getUseCase = File(getUseCaseFile(featureName));
  getUseCase.createSync();

  final managerBloc = File(managerBlocFile(featureName));
  managerBloc.createSync();

  final managerEvent = File(managerEventFile(featureName));
  managerEvent.createSync();

  final managerState = File(managerStateFile(featureName));
  managerState.createSync();

  final page = File(pageFile(featureName));
  page.createSync();

  print('Feature created successfully');
}
