import 'package:dartz/dartz.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/data/model/workspace_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/workspace_repository.dart';

class WorkspaceUseCase {
  final WorkspaceRepository workspaceRepository;

  const WorkspaceUseCase({required this.workspaceRepository});
  @override
  Future<Either<Failure, void>> createWorkspaceUseCase(
    WorkspaceModel workspaceModel,
  ) async {
    return await workspaceRepository.createWorkspace(
        workspaceModel: workspaceModel);
  }

  @override
  Future<Either<Failure, Stream<List<WorkspaceModel>>>>
      fetchWorkspaceUseCase() async {
    return await workspaceRepository.fetchAllWorkspace();
  }
}
