import 'package:dartz/dartz.dart';
import 'package:task_management/core/constants/url.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:task_management/feature/tasker_task_management/data/model/member_model.dart';

abstract class ApiDataSource {
  Future<Either<Failure, List<MemberModel>>> fetchAllMember();
}

class ApiDataSourceImplementation implements ApiDataSource {
  @override
  Future<Either<Failure, List<MemberModel>>> fetchAllMember() async {
    Uri url = Uri.parse(Urls.baseUrl);
    try {
      final response = await Dio()
          .getUri(url, options: Options(headers: {'app-id': Urls.appId}));
      List<MemberModel> allMembers = [];
      if (response.statusCode == 200) {
        final data = response.data;
        if (data.isEmpty) {
          return const Right([]);
        }

        for (var item in data['data']) {
          allMembers.add(MemberModel.fromJson(item['owner']));
        }
      }
      return Right(allMembers);
    } on FetchFailure {
      return const Left(FetchFailure(message: 'Failed to fetch..'));
    } catch (e) {
      return Left(FetchFailure(message: e.toString()));
    }
  }
}
