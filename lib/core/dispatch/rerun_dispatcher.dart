import 'package:MONO29/features/rerun/bloc/rerun_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RerunDispatcher {
  static void disPatchIsFetchRerunTab(BuildContext context, int tabIndex) {
    context.read<RerunBloc>().add(FetchTabData(tabIndex));
  }

  static void disPatchRerunYtPlaylist(
      BuildContext context, String playlistId, String playlistName) {
    context
        .read<RerunBloc>()
        .add(FetchRerunYtPlaylist(playlistId, playlistName));
  }
}
