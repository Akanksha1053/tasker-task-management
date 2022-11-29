import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/feature/tasker_task_management/data/model/member_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/usecases/fetch_members_usecase.dart';

part 'get_all_members_event.dart';
part 'get_all_members_state.dart';

class GetAllMembersBloc extends Bloc<GetAllMembersEvent, GetAllMembersState> {
  final MemberUsecase memberUsecase;

  GetAllMembersBloc(
    this.memberUsecase,
  ) : super(InitialState()) {
    List<MemberModel> selectedMemberList = [];
    List<MemberModel> allMembersList = [];

    on<FetchAllMemberEvent>((event, emit) async {
      emit(LoadingState());
      final getStatus = await memberUsecase.fetchAllMemberUseCase();
      getStatus.fold((l) => emit(FailureState(errorMessage: l.message)), (r) {
        allMembersList = r;
        emit(SuccessState(
            allMembers: r,
            selectedMemberList: selectedMemberList,
            selectedMember: selectedMemberList.length));
      });
    });
    on<SelectMemberEvent>(((event, emit) async {
      int index = selectedMemberList
          .indexWhere((element) => element == event.personSelected);
      if (index >= 0) {
        final getStatus =
            await memberUsecase.removeMemberUseCase(event.personSelected);
        getStatus.fold((l) => emit(FailureState(errorMessage: l.message)), (r) {
          selectedMemberList = r;
          emit(SuccessState(
              allMembers: allMembersList,
              selectedMemberList: r,
              selectedMember: r.length));
        });
        selectedMemberList.removeAt(index);
      } else {
        final getStatus =
            await memberUsecase.addMemberUseCase(event.personSelected);
        getStatus.fold((l) => emit(FailureState(errorMessage: l.message)), (r) {
          selectedMemberList = r;
          emit(SuccessState(
              allMembers: allMembersList,
              selectedMemberList: r,
              selectedMember: r.length));
        });
      }
    }));
  }
}
