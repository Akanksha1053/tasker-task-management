part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}
class CreateProjectEvent extends ProjectEvent {
  final ProjectModel projectModel;
  const CreateProjectEvent({required this.projectModel});
  @override
  List<Object> get props => [];
}
