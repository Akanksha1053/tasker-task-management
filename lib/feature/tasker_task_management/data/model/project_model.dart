import 'package:task_management/feature/tasker_task_management/data/model/member_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/entity/owner_entity.dart';
import 'package:task_management/feature/tasker_task_management/domain/entity/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel(
      {required super.projectName,
      required super.description,
      required super.startDate,
      required super.endDate,
      required super.members});
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      description: json['description'],
      endDate: json['endDate'],
      members: json['members'] == null
          ? null
          : List<MemberEntity>.from(
              json['members'].map((x) => MemberModel.fromJson(x))),
      projectName: json['projectName'],
      startDate: json['startDate'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'projectName': projectName,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'members': members == null
          ? null
          : List<dynamic>.from(
              members!.map((x) => (x as MemberModel).toJson())),
    };
    return data;
  }
}
