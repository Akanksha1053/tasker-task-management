import 'package:dartz/dartz.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/data/model/member_model.dart';

abstract class MemberRepository {
  Future<Either<Failure, List<MemberModel>>> fetchAllMember();

  Future<Either<Failure, List<MemberModel>>> addMembers(
      {required MemberModel memberModel});

  Future<Either<Failure, List<MemberModel>>> removeMembers(
      {required MemberModel memberModel});
}
