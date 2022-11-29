import 'package:task_management/feature/tasker_task_management/domain/entity/owner_entity.dart';

class MemberModel extends MemberEntity {
  MemberModel(
      {required super.firstName,
      required super.lastName,
      required super.picture});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        picture: json['picture']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture
    };

    return data;
  }
}
