part of 'workspace_bloc.dart';

abstract class WorkspaceEvent extends Equatable {
  const WorkspaceEvent();

  @override
  List<Object> get props => [];
}

class CreateWorkspaceEvent extends WorkspaceEvent {
  final WorkspaceModel workspaceModel;
  const CreateWorkspaceEvent({required this.workspaceModel});

  List<Object> get props => [];
}

class FetchAllWorkspaceEvent extends WorkspaceEvent {}

class WorkspaceResetEvent extends WorkspaceEvent {}
