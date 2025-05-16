import 'package:MONO29/features/home/data/models/response/check_version_response_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_accept_response_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_response_model.dart';

abstract class HomeRepository {
  Future<CheckVersionResponseModel> fetchCheckVersion(
      Map<String, dynamic> body);

  Future<UserAgreementResponseModel> fetchUserAgreement(
      Map<String, dynamic> body);

  Future<UserAgreementAcceptResponseModel> fetchUserAgreementAccept(
      Map<String, dynamic> body);
}
