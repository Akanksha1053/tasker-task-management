import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/feature/tasker_task_management/data/model/project_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/project_usecase.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectUseCase projectUseCase;
  ProjectBloc(this.projectUseCase) : super(ProjectInitialState()) {
    on<CreateProjectEvent>((event, emit) async {
      emit(ProjectLoadingState());
      final getStatus =
          await projectUseCase.createProjectUseCase(event.projectModel);
      getStatus.fold((l) => emit(ProjectFailureState(errorMessage: l.message)),
          (r) => emit(ProjectSuccessState()));
    });
  }
}
