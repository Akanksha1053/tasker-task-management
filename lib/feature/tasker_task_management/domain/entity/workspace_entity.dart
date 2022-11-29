import 'package:equatable/equatable.dart';

class WorkspaceEntity extends Equatable {
  final String name;
  final String email;
  final num numberOfMember;
  const WorkspaceEntity(
      {required this.email, required this.name, required this.numberOfMember});

  @override
  List<Object?> get props => [name, email, numberOfMember];
}
