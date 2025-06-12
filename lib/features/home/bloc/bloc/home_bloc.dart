import 'package:MONO29/core/constants/global_values.dart';
import 'package:MONO29/core/utils/device_info_helper.dart';
import 'package:MONO29/features/home/data/models/request/user_agreement_request_model.dart';
import 'package:MONO29/features/home/data/models/response/check_version_response_model.dart';
import 'package:MONO29/features/home/data/models/response/user_agreement_response_model.dart';
import 'package:MONO29/features/home/domain/repositories/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

    on<CheckVersionEvent>(
      (event, emit) async {
        final deviceInfo = await DeviceInfoHelper.getOsAndAppVersion();
        GlobalValues.udidGlobal = deviceInfo['udid'] ?? '';

        CheckVersionResponseModel versionResponse =
            await repository.fetchCheckVersion(deviceInfo);

        if (versionResponse.status!) {
          emit(AppForceUpdate());
          return;
        } else {
          String udid = GlobalValues.udidGlobal;
          UserAgreementRequestModel userAgreementRequestModel =
              UserAgreementRequestModel(udid: udid);
              
          UserAgreementResponseModel userAgreementResponseModel =
              await repository.fetchUserAgreement({'udid': udid});

          emit(ShowUserAgreement(
              userAgreementResponseModel: userAgreementResponseModel));
        }

        return;
      },
    );

    on<HomeSetCurrentPageEvent>((event, emit) {
      emit(HomeSetCurrentPageState(event.currentIndex));
    });
  }
}
