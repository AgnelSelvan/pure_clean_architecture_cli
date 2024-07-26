//Data Layer Files
import 'package:pure_clean_architecture_cli/src/utils/folders.dart';

class PureCleanArchitectureFiles {
  final String featureName;
  final PureCleanArchitectureFolders folders;

  PureCleanArchitectureFiles(
      {required this.featureName, required this.folders});

  String get localDSFile =>
      '${folders.featureDataSourceDir}/${featureName}_local_datasource.dart';
  String get remoteDSFile =>
      '${folders.featureDataSourceDir}/${featureName}_remote_datasource.dart';
  String get dataRepositoryFile =>
      '${folders.featureDataRepositoryDir}/${featureName}_repository.dart';
  String get modelFile =>
      '${folders.featureDataModelDir}/${featureName}_model.dart';

//Domain Layer Files
  String get entityFile =>
      '${folders.featureDomainEntityDir}/${featureName}_entity.dart';
  String get domainRepositoryFile =>
      '${folders.featureDomainRepositoryDir}/${featureName}_repository.dart';

  String get addUseCaseFile =>
      '${folders.featureDomainUseCaseDir}/add_${featureName}_usecase.dart';
  String get updateUseCaseFile =>
      '${folders.featureDomainUseCaseDir}/update_${featureName}_usecase.dart';
  String get deleteUseCaseFile =>
      '${folders.featureDomainUseCaseDir}/delete_${featureName}_usecase.dart';
  String get getUseCaseFile =>
      '${folders.featureDomainUseCaseDir}/get_a_${featureName}_usecase.dart';
  String get getAllUseCaseFile =>
      '${folders.featureDomainUseCaseDir}/get_all_${featureName}_usecase.dart';

//Presentation Layer Files
  String get managerBlocFile =>
      '${folders.featurePresentationManagerDir}/${featureName}_bloc.dart';
  String get managerEventFile =>
      '${folders.featurePresentationManagerDir}/${featureName}_event.dart';
  String get managerStateFile =>
      '${folders.featurePresentationManagerDir}/${featureName}_state.dart';
  String get pageFile =>
      '${folders.featurePresentationPageDir}/${featureName}_page.dart';
}

// Core Directory Files
String get coreAPIFile => '$coreDir/api/api.dart';
String get coreAssetsFile => '$coreDir/assets/assets.dart';
String get coreThemesFile => '$coreDir/themes/themes.dart';
String get coreConstantsFile => '$coreDir/constants/constants.dart';
String get coreFailureFile => '$coreDir/errors/failure.dart';
String get coreExceptionFile => '$coreDir/errors/exception.dart';
String get coreExtensionFile => '$coreDir/extension/extension.dart';
String get coreRoutesFile => '$coreDir/routes/routes.dart';
String get coreValidatorFile => '$coreDir/validator/validator.dart';
String get coreUsecaseFile => '$coreDir/utils/usecase.dart';
