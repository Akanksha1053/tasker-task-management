part of 'project_bloc.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

class ProjectInitialState extends ProjectState {}

class ProjectLoadingState extends ProjectState {}

class ProjectSuccessState extends ProjectState {}

class ProjectFailureState extends ProjectState {
  final String errorMessage;
  const ProjectFailureState({required this.errorMessage});
}
