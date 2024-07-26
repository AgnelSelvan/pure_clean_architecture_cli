import 'package:pure_clean_architecture_cli/src/utils/constants.dart';

String get coreDir => '${AppConstants.libDirectory}/core';

class PureCleanArchitectureFolders {
  final String featureName;

  PureCleanArchitectureFolders({required this.featureName});

  String get featureDir => '${AppConstants.baseDirectory}/$featureName';

// Clean Architecture Directories
  String get featureDataDir =>
      '${AppConstants.baseDirectory}/$featureName/data';
  String get featureDomainDir =>
      '${AppConstants.baseDirectory}/$featureName/domain';
  String get featurePresentationDir =>
      '${AppConstants.baseDirectory}/$featureName/presentation';

// Data Layer
  String get featureDataSourceDir => '$featureDataDir/datasource';
  String get featureDataRepositoryDir => '$featureDataDir/repository';
  String get featureDataModelDir => '$featureDataDir/models';

// Domain Layer
  String get featureDomainUseCaseDir => '$featureDomainDir/usecase';
  String get featureDomainEntityDir => '$featureDomainDir/entity';
  String get featureDomainRepositoryDir => '$featureDomainDir/repository';

// Presentation Layer
  String get featurePresentationManagerDir => '$featurePresentationDir/manager';
  String get featurePresentationPageDir => '$featurePresentationDir/pages';
  String get featurePresentationWidgetDir => '$featurePresentationDir/widgets';
}
