part of 'get_all_members_bloc.dart';

abstract class GetAllMembersState extends Equatable {
  const GetAllMembersState();

  @override
  List<Object> get props => [];
}

class InitialState extends GetAllMembersState {
  int selectedMember = 0;

  @override
  List<Object> get props => [selectedMember];
}

class LoadingState extends GetAllMembersState {}

class SuccessState extends GetAllMembersState {
  final List<MemberModel> allMembers;
  int selectedMember = 0;
  List<MemberModel> selectedMemberList = [];
  SuccessState(
      {required this.allMembers,
      required this.selectedMemberList,
      required this.selectedMember});
  @override
  List<Object> get props => [allMembers, selectedMemberList];
}

class FailureState extends GetAllMembersState {
  final String errorMessage;
  const FailureState({required this.errorMessage});
}
