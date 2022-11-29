import 'package:task_management/feature/tasker_task_management/data/datasource/remote_data_source/firestore_datasource.dart';
import 'package:task_management/feature/tasker_task_management/data/model/project_model.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final FireStoreDataSource fireStoreDataSource;
  const ProjectRepositoryImpl({required this.fireStoreDataSource});
  @override
  Future<Either<Failure, void>> createProject(
      {required ProjectModel projectModel}) async {
    return await fireStoreDataSource.createProject(projectModel: projectModel);
  }
}
