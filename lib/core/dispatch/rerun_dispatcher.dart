import 'package:MONO29/features/rerun/bloc/rerun_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RerunDispatcher {
  static void disPatchIsFetchRerunTab(BuildContext context, int tabIndex) {
    context.read<RerunBloc>().add(FetchTabData(tabIndex));
  }

  static void disPatchIsSelectSeries(
      BuildContext context, String selectedType) {
    context.read<RerunBloc>().add(SelectSeriesType(selectedType));
  }

  static void disPatchIsSelectNewsType(
      BuildContext context, String selectedType) {
    context.read<RerunBloc>().add(SelectNewsType(selectedType));
  }

  static void disPatchRerunNewsSingle(
      BuildContext context, String playlistId, String videoId) {
    context.read<RerunBloc>().add(FetchRerunNewsSingle(playlistId, videoId));
  }

  static void disPatchRerunSeriesSingle(
      BuildContext context, String playlistId, String videoId) {
    context.read<RerunBloc>().add(FetchRerunSereisSingle(playlistId, videoId));
  }
}
