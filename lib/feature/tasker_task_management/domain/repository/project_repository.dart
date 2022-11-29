import 'package:dartz/dartz.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/data/model/project_model.dart';

abstract class ProjectRepository {
  Future<Either<Failure, void>> createProject({
    required ProjectModel projectModel,
  });
}
