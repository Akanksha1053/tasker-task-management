import 'package:equatable/equatable.dart';
import 'package:task_management/feature/tasker_task_management/domain/entity/owner_entity.dart';

class ProjectEntity extends Equatable {
  final String projectName;
  final String startDate;
  final String endDate;
  final String description;
  final List<MemberEntity>? members;
  const ProjectEntity(
      {required this.projectName,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.members});

  @override
  List<Object?> get props =>
      [projectName, startDate, endDate, description, members];
}
