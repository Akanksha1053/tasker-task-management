import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/feature/tasker_task_management/data/model/member_model.dart';
import 'package:task_management/feature/tasker_task_management/data/model/project_model.dart';
import 'package:task_management/feature/tasker_task_management/data/model/workspace_model.dart';

abstract class FireStoreDataSource {
  Future<Either<Failure, void>> createWorkspace(
      {required WorkspaceModel workspaceModel});

  Future<Either<Failure, Stream<List<WorkspaceModel>>>> fetchAllWorkspace();

  Future<Either<Failure, void>> createProject(
      {required ProjectModel projectModel});

  Future<Either<Failure, List<MemberModel>>> addMember(
      {required MemberModel memberModel});

  Future<Either<Failure, List<MemberModel>>> removeMember(
      {required MemberModel memberModel});
}

class FireStoreDataSourceImpl implements FireStoreDataSource {
  List<MemberModel> selectedMemberList = [];
  @override
  Future<Either<Failure, void>> createWorkspace(
      {required WorkspaceModel workspaceModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('workspace')
          .doc(workspaceModel.name)
          .set(workspaceModel.toJson());
      return const Right(null);
    } on CreateFailure {
      return const Left(
          CreateFailure(message: 'Failed to create a new workspace....'));
    } catch (e) {
      return Left(CreateFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Stream<List<WorkspaceModel>>>>
      fetchAllWorkspace() async {
    try {
      var ref = FirebaseFirestore.instance.collection('workspace');

      final workspaceStream = ref.snapshots().map((list) =>
          list.docs.map((doc) => WorkspaceModel.fromJson(doc.data())).toList());

      return Right(workspaceStream);
    } on FetchFailure {
      return const Left(FetchFailure(message: 'Failed to fetch..'));
    } catch (e) {
      return Left(FetchFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createProject(
      {required ProjectModel projectModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('workspace')
          .doc('Coditas')
          .collection('Project')
          .doc(projectModel.projectName)
          .set(projectModel.toJson());

      return const Right(null);
    } on CreateFailure {
      return const Left(
          CreateFailure(message: 'Failed to create a new project....'));
    } catch (e) {
      return Left(CreateFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MemberModel>>> addMember(
      {required MemberModel memberModel}) async {
    try {
      selectedMemberList.add(memberModel);
      return Right(selectedMemberList);
    } on InsertionFailure catch (e) {
      return Left(InsertionFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MemberModel>>> removeMember(
      {required MemberModel memberModel}) async {
    try {
      selectedMemberList.remove(memberModel);
      return Right(selectedMemberList);
    } on InsertionFailure catch (e) {
      return Left(InsertionFailure(message: e.toString()));
    }
  }
}
