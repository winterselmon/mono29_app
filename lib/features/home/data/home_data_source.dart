import 'package:MONO29/core/constants/api_endpoints.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/home/data/models/response/check_version_response_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_accept_response_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_response_model.dart';

class HomeDataSource {
  final ApiService apiService;

  HomeDataSource(this.apiService);

  Future<dynamic> fetchCheckVersion({Map<String, dynamic>? body}) async {
    final json =
        await apiService.post(ApiEndpoints.checkVersionFeed, body: body);

    if (json is Map<String, dynamic>) {
      return CheckVersionResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }

  Future<dynamic> getUserAgreementFeed({Map<String, dynamic>? body}) async {
    final json = await apiService.post(ApiEndpoints.userAgreement, body: body);

    if (json is Map<String, dynamic>) {
      return UserAgreementResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }

  Future<dynamic> getUserAgreementAcceptFeed(
      {Map<String, dynamic>? body}) async {
    final json =
        await apiService.post(ApiEndpoints.userAgreementAccept, body: body);

    if (json is Map<String, dynamic>) {
      return UserAgreementAcceptResponseModel.fromJson(json);
    } else {
      printLog('Unexpected JSON format: $json');
    }
  }
}
