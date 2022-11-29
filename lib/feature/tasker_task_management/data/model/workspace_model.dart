import 'package:task_management/feature/tasker_task_management/domain/entity/workspace_entity.dart';

class WorkspaceModel extends WorkspaceEntity {
  const WorkspaceModel(
      {required super.email,
      required super.name,
      required super.numberOfMember});
  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceModel(
      name: json['name'],
      email: json['email'],
      numberOfMember: json['numberOfMember'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'numberOfMember': numberOfMember,
    };
    return data;
  }
}
