import 'dart:io';

import 'package:pure_clean_architecture_cli/src/content/file_content.dart';
import 'package:pure_clean_architecture_cli/src/utils/constants.dart';
import 'package:pure_clean_architecture_cli/src/utils/file_utils.dart';
import 'package:pure_clean_architecture_cli/src/utils/files.dart';
import 'package:pure_clean_architecture_cli/src/utils/folders.dart';
import 'package:pure_clean_architecture_cli/src/utils/log/log.dart';

bool _checkIfFeatureExists(String featurePath) {
  final featureDirectory = Directory(featurePath);
  return featureDirectory.existsSync();
}

String getPackageName() {
  final pubspecFile = File(AppConstants.pubspecYamlFile);
  final lines = pubspecFile.readAsLinesSync();
  final packageNameLine = lines.firstWhere((line) => line.contains('name:'));
  final packageName = packageNameLine.split(':')[1].trim();
  return packageName;
}

void createNewFeature(String featureName, bool isFreezed) {
  final featureFolders = PureCleanArchitectureFolders(featureName: featureName);
  final featureFiles = PureCleanArchitectureFiles(
      featureName: featureName, folders: featureFolders);
  if (_checkIfFeatureExists(featureFolders.featureDir)) {
    Logger.red.log('Feature ($featureName) already exists');
    exit(1);
  }

  FileUtils.createDirectory(featureFolders.featureDir);

  FileUtils.createDirectory(featureFolders.featureDataDir);

  FileUtils.createDirectory(featureFolders.featureDomainDir);

  FileUtils.createDirectory(featureFolders.featurePresentationDir);

  FileUtils.createDirectory(featureFolders.featureDataSourceDir);

  FileUtils.createDirectory(featureFolders.featureDataRepositoryDir);

  FileUtils.createDirectory(featureFolders.featureDataModelDir);

  FileUtils.createDirectory(featureFolders.featureDomainUseCaseDir);

  FileUtils.createDirectory(featureFolders.featureDomainEntityDir);

  FileUtils.createDirectory(featureFolders.featureDomainRepositoryDir);

  FileUtils.createDirectory(featureFolders.featurePresentationManagerDir);

  FileUtils.createDirectory(featureFolders.featurePresentationPageDir);

  FileUtils.createDirectory(featureFolders.featurePresentationWidgetDir);

  FileUtils.createFile(featureFiles.localDSFile);

  FileUtils.createFile(featureFiles.remoteDSFile);

  FileUtils.createFile(featureFiles.dataRepositoryFile);

  FileUtils.createFile(featureFiles.modelFile);

  FileUtils.createFile(featureFiles.entityFile);

  FileUtils.createFile(featureFiles.domainRepositoryFile);

  FileUtils.createFile(featureFiles.pageFile);

  final packageName = getPackageName();

  //Entity
  FileUtils.writeFile(
    FileUtils.getFile(featureFiles.entityFile),
    getEntityFileContent(featureName),
  );
  //Models
  if (isFreezed) {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.modelFile),
      getFreezedModelFileContent(featureName, packageName),
    );
  } else {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.modelFile),
      getModelFileContent(featureName, packageName),
    );
  }
  //Local DataSource
  if (isFreezed) {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.localDSFile),
      getFreezedLocalDataSourceFileContent(featureName, packageName),
    );
  } else {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.localDSFile),
      getLocalDataSourceFileContent(featureName, packageName),
    );
  }
  //Remote DataSource
  if (isFreezed) {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.remoteDSFile),
      getFreezedRemoteDataSourceFileContent(featureName, packageName),
    );
  } else {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.remoteDSFile),
      getRemoteDataSourceFileContent(featureName, packageName),
    );
  }
  //Domain Repository
  if (isFreezed) {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.domainRepositoryFile),
      domainFreezedRepositoryFileContent(featureName, packageName),
    );
  } else {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.domainRepositoryFile),
      domainRepositoryFileContent(featureName, packageName),
    );
  }
  //Data Repository
  if (isFreezed) {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.dataRepositoryFile),
      dataFreezedRepositoryFileContent(featureName, packageName),
    );
  } else {
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.dataRepositoryFile),
      dataRepositoryFileContent(featureName, packageName),
    );
  }
  if (!isFreezed) {
    FileUtils.createFile(featureFiles.addUseCaseFile);

    FileUtils.createFile(featureFiles.updateUseCaseFile);

    FileUtils.createFile(featureFiles.deleteUseCaseFile);

    FileUtils.createFile(featureFiles.getUseCaseFile);

    FileUtils.createFile(featureFiles.managerBlocFile);

    FileUtils.createFile(featureFiles.managerEventFile);

    FileUtils.createFile(featureFiles.managerStateFile);

    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.addUseCaseFile),
      addUseCaseFileContent(featureName, packageName),
    );
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.updateUseCaseFile),
      updateUseCaseFileContent(featureName, packageName),
    );
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.deleteUseCaseFile),
      deleteUseCaseFileContent(featureName, packageName),
    );
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.getAllUseCaseFile),
      getAllUseCaseFileContent(featureName, packageName),
    );
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.getUseCaseFile),
      getUseCaseFileContent(featureName, packageName),
    );
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.managerBlocFile),
      getBlocFileContent(featureName, packageName),
    );
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.managerEventFile),
      getBlocEventFileContent(featureName, packageName),
    );
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.managerStateFile),
      getBlocStateFileContent(featureName, packageName),
    );
  } else {
    //Cubit
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.managerCubitFile),
      getFreezedCubitFileContent(featureName, packageName),
    );
    //Cubit State
    FileUtils.writeFile(
      FileUtils.getFile(featureFiles.managerCubitStateFile),
      getFreezedCubitStateFileContent(featureName, packageName),
    );
  }
  FileUtils.writeFile(
    FileUtils.getFile(featureFiles.pageFile),
    getPageFileContent(featureName, packageName),
  );

  Logger.green.log('Feature created successfully');
}
