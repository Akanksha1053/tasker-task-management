part of 'get_all_members_bloc.dart';

abstract class GetAllMembersEvent extends Equatable {
  const GetAllMembersEvent();

  @override
  List<Object> get props => [];
}

class FetchAllMemberEvent extends GetAllMembersEvent {}

class SelectMemberEvent extends GetAllMembersEvent {
  final MemberModel personSelected;
  const SelectMemberEvent({required this.personSelected});
  @override
  List<Object> get props => [personSelected];
}
