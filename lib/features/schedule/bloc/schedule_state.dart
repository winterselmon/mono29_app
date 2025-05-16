part of 'schedule_bloc.dart';

sealed class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

final class ScheduleInitial extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final ScheduleResponseModel scheduleResponseModel;
  const ScheduleLoaded(this.scheduleResponseModel);
}

class ScheduleDetailLoaded extends ScheduleState {
  final ScheduleDetailResponseModel scheduleDetailResponseModel;
  const ScheduleDetailLoaded(this.scheduleDetailResponseModel);
}

class ScheduleLoading extends ScheduleState {}

class ScheduleError extends ScheduleState {
  final String message;
  const ScheduleError(this.message);
}

class ScheduleNotif extends ScheduleState {
  final bool isActiveNotif;

  const ScheduleNotif({required this.isActiveNotif});

  @override
  List<Object> get props => [isActiveNotif];
}
