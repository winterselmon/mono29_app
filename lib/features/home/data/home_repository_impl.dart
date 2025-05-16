import 'package:MONO29/features/home/data/home_data_source.dart';
import 'package:MONO29/features/home/data/models/response/check_version_response_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_accept_response_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_response_model.dart';
import 'package:MONO29/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<CheckVersionResponseModel> fetchCheckVersion(
      Map<String, dynamic>? body) async {
    return await dataSource.fetchCheckVersion(body: body);
  }

  @override
  Future<UserAgreementResponseModel> fetchUserAgreement(
      Map<String, dynamic> body) async {
    return await dataSource.getUserAgreementFeed(body: body);
  }

  @override
  Future<UserAgreementAcceptResponseModel> fetchUserAgreementAccept(
      Map<String, dynamic> body) async {
    return await dataSource.getUserAgreementAcceptFeed(body: body);
  }
}
