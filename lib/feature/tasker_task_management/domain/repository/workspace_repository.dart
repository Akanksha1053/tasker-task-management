import 'package:dartz/dartz.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/data/model/workspace_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/workspace_usecase.dart';

abstract class WorkspaceRepository {
  Future<Either<Failure, void>> createWorkspace(
      {required WorkspaceModel workspaceModel});
  Future<Either<Failure, Stream<List<WorkspaceModel>>>> fetchAllWorkspace();
}
