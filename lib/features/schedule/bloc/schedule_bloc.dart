import 'package:MONO29/features/schedule/data/models/request/schedule_detail_request_model.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_detail_response_model.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_response_model.dart';
import 'package:MONO29/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final ScheduleRepository repository;

  ScheduleBloc(this.repository) : super(ScheduleInitial()) {
    on<ScheduleEvent>((event, emit) {});

    on<FetchScheduleEvent>((event, emit) async {
      emit(ScheduleLoading());
      try {
        final result = await repository.fetchSchedule();
        emit(ScheduleLoaded(result));
      } catch (e) {
        emit(ScheduleError(e.toString()));
      }
    });

    on<FetchScheduleDetailEvent>((event, emit) async {
      emit(ScheduleLoading());
      try {
        // Map<String, String> body = {'post_id': event.postId};
        ScheduleDetailRequestModel scheduleDetailRequestModel =
            ScheduleDetailRequestModel();
        scheduleDetailRequestModel.postId = event.postId;

        final result = await repository.fetchScheduleDetail(
            body: scheduleDetailRequestModel.toJson());

        emit(ScheduleDetailLoaded(result));
      } catch (e) {
        emit(ScheduleError(e.toString()));
      }
    });

    on<ToggleCheckboxEvent>((event, emit) {
      final currentState = state;
      bool current = false;

      if (currentState is ScheduleNotif) {
        current = currentState.isActiveNotif;
      }

      emit(ScheduleNotif(isActiveNotif: !current));
    });
  }
}
