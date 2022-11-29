import 'package:task_management/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task_management/feature/tasker_task_management/data/datasource/remote_data_source/api_datasource.dart';
import 'package:task_management/feature/tasker_task_management/data/datasource/remote_data_source/firestore_datasource.dart';
import 'package:task_management/feature/tasker_task_management/data/model/member_model.dart';
import 'package:task_management/feature/tasker_task_management/domain/repository/member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  final ApiDataSource apiDataSource;
  final FireStoreDataSource fireStoreDataSource;
  const MemberRepositoryImpl(this.fireStoreDataSource,
      {required this.apiDataSource});

  @override
  Future<Either<Failure, List<MemberModel>>> fetchAllMember() async {
    return await apiDataSource.fetchAllMember();
  }

  @override
  Future<Either<Failure, List<MemberModel>>> addMembers(
      {required MemberModel memberModel}) async {
    return await fireStoreDataSource.addMember(memberModel: memberModel);
  }

  @override
  Future<Either<Failure, List<MemberModel>>> removeMembers(
      {required MemberModel memberModel}) async {
    return await fireStoreDataSource.removeMember(memberModel: memberModel);
  }
}
