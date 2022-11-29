import 'package:dartz/dartz.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/data/model/member_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/member_repository.dart';

class MemberUsecase {
  final MemberRepository memberRepository;
  const MemberUsecase({required this.memberRepository});
  @override
  Future<Either<Failure, List<MemberModel>>> fetchAllMemberUseCase() async {
    return await memberRepository.fetchAllMember();
  }

  @override
  Future<Either<Failure, List<MemberModel>>> addMemberUseCase(
    MemberModel memberModel,
  ) async {
    return await memberRepository.addMembers(memberModel: memberModel);
  }

  @override
  Future<Either<Failure, List<MemberModel>>> removeMemberUseCase(
    MemberModel memberModel,
  ) async {
    return await memberRepository.removeMembers(memberModel: memberModel);
  }
}
