import 'package:pure_clean_architecture_cli/extensions/string.dart';

String getExceptionFileContent() {
  return '''
class ServerException implements Exception {}

class NullDataException implements Exception {}

class CacheException implements Exception {}

class InvalidInputException implements Exception {}

''';
}

String getFailureFileContent() {
  return '''
class Failure {
  String message;
  int? code;
  Failure({required this.message, this.code});

  @override
  String toString() {
    return message;
  }
}
''';
}

String getBlocStateFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
part of '${featureName}_bloc.dart';

class ${featureNameUppercase}State extends Equatable {
  final List<${featureNameUppercase}Entity> all${featureNameUppercase}s;
  final ${featureNameUppercase}Entity? a$featureNameUppercase;
  const ${featureNameUppercase}State({
    this.all${featureNameUppercase}s = const [],
    this.a$featureNameUppercase,
  });

  @override
  List<Object> get props => [];

  ${featureNameUppercase}State copyWith({
    List<${featureNameUppercase}Entity>? all${featureNameUppercase}s,
    ${featureNameUppercase}Entity? a$featureNameUppercase,
  }) {
    return ${featureNameUppercase}State(
      all${featureNameUppercase}s: all${featureNameUppercase}s ?? this.all${featureNameUppercase}s,
      a$featureNameUppercase: a$featureNameUppercase ?? this.a$featureNameUppercase,
    );
  }

  ${featureNameUppercase}Error emitError(Failure error) {
    return ${featureNameUppercase}Error(
      message: error,
      all${featureNameUppercase}s: all${featureNameUppercase}s,
      a$featureNameUppercase: a$featureNameUppercase,
    );
  }

  ${featureNameUppercase}Loaded emitLoaded() {
    return ${featureNameUppercase}Loaded(
      all${featureNameUppercase}s: all${featureNameUppercase}s,
      a$featureNameUppercase: a$featureNameUppercase,
    );
  }
}

class ${featureNameUppercase}Error extends ${featureNameUppercase}State {
  final Failure message;
  const ${featureNameUppercase}Error({
    super.a$featureNameUppercase,
    super.all${featureNameUppercase}s,
    required this.message,
  });
}

class ${featureNameUppercase}Loading extends ${featureNameUppercase}State {
  const ${featureNameUppercase}Loading({
    super.a$featureNameUppercase,
    super.all${featureNameUppercase}s,
  });
}


class ${featureNameUppercase}Loaded extends ${featureNameUppercase}State {
  const ${featureNameUppercase}Loaded({
    super.a$featureNameUppercase,
    super.all${featureNameUppercase}s,
  });
}
''';
}

String getBlocEventFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
part of '${featureName}_bloc.dart';

class ${featureNameUppercase}Event extends Equatable {
  const ${featureNameUppercase}Event();

  @override
  List<Object> get props => [];
}

class Add${featureNameUppercase}Event extends ${featureNameUppercase}Event {
  final Add${featureNameUppercase}Params params;

  const Add${featureNameUppercase}Event({required this.params});
}

class Update${featureNameUppercase}Event extends ${featureNameUppercase}Event {
  final Update${featureNameUppercase}Params params;

  const Update${featureNameUppercase}Event({required this.params});
}

class Delete${featureNameUppercase}Event extends ${featureNameUppercase}Event {
  final String id;
  const Delete${featureNameUppercase}Event({required this.id});
}

class GetAll${featureNameUppercase}sEvent extends ${featureNameUppercase}Event {}

class GetA${featureNameUppercase}Event extends ${featureNameUppercase}Event {
  final String id;
  const GetA${featureNameUppercase}Event({required this.id});
}
''';
}

String getBlocFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:$packageName/core/errors/failure.dart';
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';
import 'package:$packageName/features/$featureName/domain/usecase/add_${featureName}_usecase.dart';
import 'package:$packageName/features/$featureName/domain/usecase/delete_${featureName}_usecase.dart';
import 'package:$packageName/features/$featureName/domain/usecase/get_a_${featureName}_usecase.dart';
import 'package:$packageName/features/$featureName/domain/usecase/get_all_${featureName}_usecase.dart';
import 'package:$packageName/features/$featureName/domain/usecase/update_${featureName}_usecase.dart';
import 'package:$packageName/core/utils/usecase.dart';

part '${featureName}_event.dart';
part '${featureName}_state.dart';

class ${featureNameUppercase}Bloc extends Bloc<${featureNameUppercase}Event, ${featureNameUppercase}State> {
  final Add${featureNameUppercase}UseCase add${featureNameUppercase}UseCase;
  final Update${featureNameUppercase}UseCase update${featureNameUppercase}UseCase;
  final Delete${featureNameUppercase}UseCase delete${featureNameUppercase}UseCase;
  final GetAll${featureNameUppercase}UseCase getAll${featureNameUppercase}UseCase;
  final GetA${featureNameUppercase}UseCase getA${featureNameUppercase}UseCase;

  ${featureNameUppercase}Bloc(this.add${featureNameUppercase}UseCase, this.update${featureNameUppercase}UseCase, this.delete${featureNameUppercase}UseCase,
      this.getAll${featureNameUppercase}UseCase, this.getA${featureNameUppercase}UseCase)
      : super(const ${featureNameUppercase}Loading()) {
    on<GetAll${featureNameUppercase}sEvent>((event, emit) async {
      final response = await getAll${featureNameUppercase}UseCase.call(NoParams());
      response.fold(
        (l) => emit(state.emitError(l)),
        (r) => emit(
          state.copyWith(
            all${featureNameUppercase}s: r,
          ).emitLoaded(),
        ),
      );
    });

    on<GetA${featureNameUppercase}Event>((event, emit) async {
      final response = await getA${featureNameUppercase}UseCase.call(event.id);
      response.fold(
        (l) => emit(state.emitError(l)),
        (r) => emit(
          state.copyWith(
            all${featureNameUppercase}s: state.all${featureNameUppercase}s,
            a$featureNameUppercase: r,
          ),
        ),
      );
    });

    on<Add${featureNameUppercase}Event>((event, emit) async {
      final response = await add${featureNameUppercase}UseCase.call(event.params);
      response.fold(
        (l) => emit(state.emitError(l)),
        (r) => add(GetAll${featureNameUppercase}sEvent()),
      );
    });

    on<Update${featureNameUppercase}Event>((event, emit) async {
      final response = await update${featureNameUppercase}UseCase.call(event.params);
      response.fold(
        (l) => emit(state.emitError(l)),
        (r) => add(GetAll${featureNameUppercase}sEvent()),
      );
    });

    on<Delete${featureNameUppercase}Event>((event, emit) async {
      final response = await delete${featureNameUppercase}UseCase.call(event.id);
      response.fold(
        (l) => emit(state.emitError(l)),
        (r) => add(GetAll${featureNameUppercase}sEvent()),
      );
    });
  }
}
''';
}

String getUseCaseFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
import 'package:$packageName/core/utils/usecase.dart';
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';
import 'package:$packageName/features/$featureName/domain/repository/${featureName}_repository.dart';
import 'package:$packageName/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class GetA${featureNameUppercase}UseCase extends UseCase<${featureNameUppercase}Entity?, String> {
  final ${featureNameUppercase}Repository repository;

  GetA${featureNameUppercase}UseCase({required this.repository});

  @override
  Future<Either<Failure, ${featureNameUppercase}Entity?>> call(String params) {
    return repository.get$featureNameUppercase(params);
  }
}
''';
}

String getAllUseCaseFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
import 'package:$packageName/core/utils/usecase.dart';
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';
import 'package:$packageName/features/$featureName/domain/repository/${featureName}_repository.dart';
import 'package:$packageName/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class GetAll${featureNameUppercase}UseCase extends UseCase<List<${featureNameUppercase}Entity>, NoParams> {
  final ${featureNameUppercase}Repository repository;

  GetAll${featureNameUppercase}UseCase({required this.repository});

  @override
  Future<Either<Failure, List<${featureNameUppercase}Entity>>> call(NoParams params) {
    return repository.getAll${featureNameUppercase}s();
  }
}
''';
}

String deleteUseCaseFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
import 'package:$packageName/core/utils/usecase.dart';
import 'package:$packageName/features/$featureName/domain/repository/${featureName}_repository.dart';
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';
import 'package:$packageName/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class Delete${featureNameUppercase}UseCase extends UseCase<${featureNameUppercase}Entity, String> {
  final ${featureNameUppercase}Repository repository;

  Delete${featureNameUppercase}UseCase({required this.repository});

  @override
  Future<Either<Failure, ${featureNameUppercase}Entity>> call(String params) {
    return repository.delete$featureNameUppercase(params);
  }
}
''';
}

String updateUseCaseFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
import 'package:$packageName/core/utils/usecase.dart';
import 'package:$packageName/features/$featureName/domain/repository/${featureName}_repository.dart';
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';
import 'package:$packageName/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class Update${featureNameUppercase}UseCase extends UseCase<${featureNameUppercase}Entity, Update${featureNameUppercase}Params> {
  final ${featureNameUppercase}Repository repository;

  Update${featureNameUppercase}UseCase({required this.repository});

  @override
  Future<Either<Failure, ${featureNameUppercase}Entity>> call(Update${featureNameUppercase}Params params) {
    return repository.update$featureNameUppercase(params);
  }
}

class Update${featureNameUppercase}Params {}
''';
}

String addUseCaseFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
import 'package:$packageName/core/utils/usecase.dart';
import 'package:$packageName/features/$featureName/domain/repository/${featureName}_repository.dart';
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';
import 'package:$packageName/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class Add${featureNameUppercase}UseCase extends UseCase<${featureNameUppercase}Entity, Add${featureNameUppercase}Params> {
  final ${featureNameUppercase}Repository repository;

  Add${featureNameUppercase}UseCase({required this.repository});

  @override
  Future<Either<Failure, ${featureNameUppercase}Entity>> call(Add${featureNameUppercase}Params params) {
    return repository.create$featureNameUppercase(params);
  }
}

class Add${featureNameUppercase}Params {}
''';
}

String dataRepositoryFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  final snakeCaseFeatureName = featureName.snakeToCamelFirstLetterSmall();
  return '''
import 'package:$packageName/core/errors/failure.dart';
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';
import 'package:$packageName/features/$featureName/domain/repository/${featureName}_repository.dart';
import 'package:$packageName/features/$featureName/domain/usecase/add_${featureName}_usecase.dart';
import 'package:$packageName/features/$featureName/data/datasource/${featureName}_local_datasource.dart';
import 'package:$packageName/features/$featureName/data/datasource/${featureName}_remote_datasource.dart';
import 'package:$packageName/features/$featureName/domain/usecase/update_${featureName}_usecase.dart';
import 'package:dartz/dartz.dart';

class ${featureNameUppercase}RepositoryImpl extends ${featureNameUppercase}Repository {
  final ${featureNameUppercase}LocalDataSource localDataSource;
  final ${featureNameUppercase}RemoteDataSource remoteDataSource;

  ${featureNameUppercase}RepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, ${featureNameUppercase}Entity>> create$featureNameUppercase(Add${featureNameUppercase}Params ${snakeCaseFeatureName}Params) {
    // TODO: implement create$featureNameUppercase
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ${featureNameUppercase}Entity>> get$featureNameUppercase(String id) {
    // TODO: implement get$featureNameUppercase
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<${featureNameUppercase}Entity>>> getAll${featureNameUppercase}s() {
    // TODO: implement get${featureNameUppercase}s
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ${featureNameUppercase}Entity>> update$featureNameUppercase(Update${featureNameUppercase}Params ${snakeCaseFeatureName}Params) {
    // TODO: implement update$featureNameUppercase
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ${featureNameUppercase}Entity>> delete$featureNameUppercase(String ${snakeCaseFeatureName}Id) {
    // TODO: implement delete$featureNameUppercase
    throw UnimplementedError();
  }
}

''';
}

String domainRepositoryFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  final snakeCaseFeatureName = featureName.snakeToCamelFirstLetterSmall();
  return '''
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';
import 'package:$packageName/features/$featureName/domain/usecase/add_${featureName}_usecase.dart';
import 'package:$packageName/features/$featureName/domain/usecase/update_${featureName}_usecase.dart';
import 'package:$packageName/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ${featureNameUppercase}Repository {
  Future<Either<Failure, ${featureNameUppercase}Entity>> get$featureNameUppercase(String id);
  Future<Either<Failure, List<${featureNameUppercase}Entity>>> getAll${featureNameUppercase}s();
  Future<Either<Failure, ${featureNameUppercase}Entity>> create$featureNameUppercase(Add${featureNameUppercase}Params ${snakeCaseFeatureName}Params);
  Future<Either<Failure, ${featureNameUppercase}Entity>> update$featureNameUppercase(Update${featureNameUppercase}Params ${snakeCaseFeatureName}Params);
  Future<Either<Failure, ${featureNameUppercase}Entity>> delete$featureNameUppercase(String ${snakeCaseFeatureName}Id);
}
''';
}

String getRemoteDataSourceFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  final snakeCaseFeatureName = featureName.snakeToCamelFirstLetterSmall();
  return '''
import 'package:$packageName/features/$featureName/data/models/${featureName}_model.dart';
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';

abstract class ${featureNameUppercase}RemoteDataSource {
  Future<List<${featureNameUppercase}Model>> getAll${featureNameUppercase}s();
  Future<${featureNameUppercase}Entity> add$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model);
  Future<${featureNameUppercase}Entity> update$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model);
  Future<${featureNameUppercase}Entity> delete$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model);
  Future<${featureNameUppercase}Model?> get${featureNameUppercase}ById(String id);
}

class ${featureNameUppercase}RemoteDataSourceImpl extends ${featureNameUppercase}RemoteDataSource {
  @override
  Future<${featureNameUppercase}Entity> add$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model) {
    // TODO: implement add$featureNameUppercase
    throw UnimplementedError();
  }

  @override
  Future<${featureNameUppercase}Entity> delete$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model) {
    // TODO: implement delete$featureNameUppercase
    throw UnimplementedError();
  }

  @override
  Future<List<${featureNameUppercase}Model>> getAll${featureNameUppercase}s() {
    // TODO: implement getAll${featureNameUppercase}s
    throw UnimplementedError();
  }

  @override
  Future<${featureNameUppercase}Entity> update$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model) {
    // TODO: implement update$featureNameUppercase
    throw UnimplementedError();
  }

  @override
  Future<${featureNameUppercase}Model?> get${featureNameUppercase}ById(String id) {
    // TODO: implement get${featureNameUppercase}ById
    throw UnimplementedError();
  }
}
''';
}

String getLocalDataSourceFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  final snakeCaseFeatureName = featureName.snakeToCamelFirstLetterSmall();
  return '''
import 'package:$packageName/features/$featureName/data/models/${featureName}_model.dart';
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';

abstract class ${featureNameUppercase}LocalDataSource {
  Future<List<${featureNameUppercase}Model>> getAll${featureNameUppercase}s();
  Future<${featureNameUppercase}Entity> add$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model);
  Future<${featureNameUppercase}Entity> update$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model);
  Future<${featureNameUppercase}Entity> delete$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model);
  Future<${featureNameUppercase}Model?> get${featureNameUppercase}ById(String id);
}

class ${featureNameUppercase}LocalDataSourceImpl extends ${featureNameUppercase}LocalDataSource {

  @override
  Future<${featureNameUppercase}Entity> add$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model) {
    // TODO: implement add$featureNameUppercase
    throw UnimplementedError();
  }

  @override
  Future<${featureNameUppercase}Entity> delete$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model) {
    // TODO: implement delete$featureNameUppercase
    throw UnimplementedError();
  }

  @override
  Future<List<${featureNameUppercase}Model>> getAll${featureNameUppercase}s() {
    // TODO: implement getAll${featureNameUppercase}s
    throw UnimplementedError();
  }

  @override
  Future<${featureNameUppercase}Entity> update$featureNameUppercase(${featureNameUppercase}Model ${snakeCaseFeatureName}Model) {
    // TODO: implement update$featureNameUppercase
    throw UnimplementedError();
  }

  @override
  Future<${featureNameUppercase}Model?> get${featureNameUppercase}ById(String id) {
    // TODO: implement get${featureNameUppercase}ById
    throw UnimplementedError();
  }
}
''';
}

String getEntityFileContent(String featureName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
class ${featureNameUppercase}Entity {}
''';
}

String getModelFileContent(String featureName, String packageName) {
  final featureNameUppercase = featureName.snakeToCamel();
  return '''
import 'package:$packageName/features/$featureName/domain/entity/${featureName}_entity.dart';

class ${featureNameUppercase}Model extends ${featureNameUppercase}Entity {
  ${featureNameUppercase}Model();

  factory ${featureNameUppercase}Model.fromJson() {
    return ${featureNameUppercase}Model();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
''';
}

String getUtilsUsecaseFileContent(String packageName) {
  return '''
import 'package:$packageName/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
''';
}
