import 'package:task_management/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_management/feature/tasker_task_management/data/datasource/remote_data_source/firestore_datasource.dart';
import 'package:task_management/feature/tasker_task_management/data/model/workspace_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/workspace_repository.dart';

class WorkspaceRepositoryImpl implements WorkspaceRepository {
  final FireStoreDataSource fireStoreDataSource;
  const WorkspaceRepositoryImpl({required this.fireStoreDataSource});
  @override
  Future<Either<Failure, void>> createWorkspace(
      {required WorkspaceModel workspaceModel}) async {
    return await fireStoreDataSource.createWorkspace(
        workspaceModel: workspaceModel);
  }

  @override
  Future<Either<Failure, Stream<List<WorkspaceModel>>>>
      fetchAllWorkspace() async {
    return await fireStoreDataSource.fetchAllWorkspace();
  }
}
