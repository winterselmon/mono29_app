import 'package:MONO29/features/schedule/bloc/schedule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDispatcher {
  static void disPatchFetchScheduleDetail(BuildContext context, String postId) {
    context.read<ScheduleBloc>().add(FetchScheduleDetailEvent(postId));
  }

  static void disPatchActiveNotif(BuildContext context) {
    context.read<ScheduleBloc>().add(ToggleCheckboxEvent());
  }
}
