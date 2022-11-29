import 'package:dartz/dartz.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/data/model/project_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/project_repository.dart';

class ProjectUseCase {
  final ProjectRepository projectRepository;

  const ProjectUseCase({required this.projectRepository});
  @override
  Future<Either<Failure, void>> createProjectUseCase(
    ProjectModel projectModel,
  ) async {
    return await projectRepository.createProject(projectModel: projectModel);
  }
}
