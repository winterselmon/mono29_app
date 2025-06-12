import 'package:MONO29/features/rerun/data/models/request/rerun_yt_playlist_request_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_highlight_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_news_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_playlist_response_model.dart';
import 'package:MONO29/features/rerun/domain/repositories/rerun_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rerun_event.dart';
part 'rerun_state.dart';

class RerunBloc extends Bloc<RerunEvent, RerunState> {
  final RerunRepository repository;
  // bool isPlaylistMode = false; // <- เพิ่มตรงนี้

  RerunBloc(this.repository) : super(RerunInitial()) {
    on<RerunEvent>((event, emit) {});

    on<FetchTabData>(
      (event, emit) async {
        emit(RerunLoading());
        try {
          if (event.tabIndex == 0) {
            // RerunHighlightResposneModel rerunHighlightResposneModel =
            //     await repository.fetchRerunHighLight();

            // emit(RerunHighlightLoaded(rerunHighlightResposneModel));
            RerunYtHighlightResponseModel rerunYtHighlightResponseModel =
                await repository.fetchRerunYtHighlight();

            emit(RerunHighlightLoaded(rerunYtHighlightResponseModel));
          } else if (event.tabIndex == 1) {
            RerunSeriesResposneModel rerunSeriesResposneModel =
                await repository.fetchRerunSeries();

            emit(RerunSeriesLoaded(rerunSeriesResposneModel));
          } else if (event.tabIndex == 2) {
            RerunYtNewsResponseModel rerunYtNewsResponseModel =
                await repository.fetchRerunYtNews();

            emit(RerunNewsLoaded(rerunYtNewsResponseModel));
          }
        } catch (e) {
          emit(RerunError(e.toString()));
        }
      },
    );

    on<FetchRerunYtPlaylist>((event, emit) async {
      emit(RerunLoading()); // ให้ UI reset ก่อน

      RerunYtPlaylistRequestModel rerunYtPlaylistRequestModel =
          RerunYtPlaylistRequestModel();
      rerunYtPlaylistRequestModel.playlistId = event.playlistId;

      RerunYtPlaylistResponseModel rerunYtPlaylistResponseModel =
          await repository.fetchRerunYtPlaylist(
              body: rerunYtPlaylistRequestModel.toJson());

      emit(RerunPlaylistLoaded(
        rerunYtPlaylistResponseModel,
        event.playlistId,
        event.playlistName,
      ));
    });
  }
}
