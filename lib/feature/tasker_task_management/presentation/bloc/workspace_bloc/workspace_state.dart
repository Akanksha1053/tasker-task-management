part of 'workspace_bloc.dart';

abstract class WorkspaceState extends Equatable {
  const WorkspaceState();

  @override
  List<Object> get props => [];
}

class InitialState extends WorkspaceState {}

class LoadingState extends WorkspaceState {}

class SuccessState extends WorkspaceState {}

class GetWorkspaceSuccessState extends WorkspaceState {
  final Stream<List<WorkspaceModel>> allWorkspaces;
  const GetWorkspaceSuccessState({required this.allWorkspaces});
  @override
  List<Object> get props => [allWorkspaces];
}

class FailureState extends WorkspaceState {
  final String errorMessage;
  const FailureState({required this.errorMessage});
}
