import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/feature/tasker_task_management/data/model/workspace_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/workspace_usecase.dart';

part 'workspace_event.dart';
part 'workspace_state.dart';

class WorkspaceBloc extends Bloc<WorkspaceEvent, WorkspaceState> {
  final WorkspaceUseCase workspaceUseCase;
  WorkspaceBloc(this.workspaceUseCase) : super(InitialState()) {
    on<CreateWorkspaceEvent>((event, emit) async {
      emit(LoadingState());
      final getStatus =
          await workspaceUseCase.createWorkspaceUseCase(event.workspaceModel);
      getStatus.fold((l) => emit(FailureState(errorMessage: l.message)),
          (r) => emit(SuccessState()));
    });
    on<WorkspaceResetEvent>((event, emit) => emit(InitialState()));
    on<FetchAllWorkspaceEvent>((event, emit) async {
      emit(LoadingState());
      final getStatus = await workspaceUseCase.fetchWorkspaceUseCase();
      getStatus.fold((l) => emit(FailureState(errorMessage: l.message)),
          (r) => emit(GetWorkspaceSuccessState(allWorkspaces: r)));
    });
  }
}
