import 'package:MONO29/features/rerun/data/models/request/rerun_news_single_request_model.dart';
import 'package:MONO29/features/rerun/data/models/request/rerun_series_single_request_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_highlight_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_single_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_single_response_model.dart';
import 'package:MONO29/features/rerun/domain/repositories/rerun_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rerun_event.dart';
part 'rerun_state.dart';

class RerunBloc extends Bloc<RerunEvent, RerunState> {
  final RerunRepository repository;
  RerunBloc(this.repository) : super(RerunInitial()) {
    on<RerunEvent>((event, emit) {});

    on<FetchTabData>(
      (event, emit) async {
        emit(RerunLoading());
        try {
          if (event.tabIndex == 0) {
            RerunHighlightResposneModel rerunHighlightResposneModel =
                await repository.fetchRerunHighLight();

            emit(RerunHighlightLoaded(rerunHighlightResposneModel));
          } else if (event.tabIndex == 1) {
            RerunSeriesResposneModel rerunSeriesResposneModel =
                await repository.fetchRerunSeries();

            emit(RerunSeriesLoaded(rerunSeriesResposneModel));
          } else if (event.tabIndex == 2) {
            RerunNewsResposneModel rerunNewsResposneModel =
                await repository.fetchRerunNews();

            emit(RerunNewsLoaded(rerunNewsResposneModel));
          }
        } catch (e) {
          emit(RerunError(e.toString()));
        }
      },
    );

    on<SelectSeriesType>(
      (event, emit) {
        emit(SelectSeriesTypeState(event.selectedType));
      },
    );

    on<SelectNewsType>(
      (event, emit) {
        emit(SelectNewsTypeState(event.selectedType));
      },
    );

    on<FetchRerunNewsSingle>((event, emit) async {
      emit(RerunLoading()); // ให้ UI reset ก่อน

      RerunNewsSingleRequestModel rerunNewsSingleRequestModel =
          RerunNewsSingleRequestModel();
      rerunNewsSingleRequestModel.playlistId = event.playlistId;
      rerunNewsSingleRequestModel.videoId = event.videoId;

      RerunNewsSingleResponseModel rerunNewsSingleResponseModel =
          await repository.fetchRerunNewsSingle(
              body: rerunNewsSingleRequestModel.toJson());

      emit(RerunNewsSingleLoaded(
          rerunNewsSingleResponseModel, event.playlistId, event.videoId));
    });

    on<FetchRerunSereisSingle>((event, emit) async {
      emit(RerunLoading()); // ให้ UI reset ก่อน

      RerunSeriesSingleRequestModel rerunSeriesSingleRequestModel =
          RerunSeriesSingleRequestModel();
      rerunSeriesSingleRequestModel.playlistId = event.playlistId;
      rerunSeriesSingleRequestModel.videoId = event.videoId;

      RerunSeriesSingleResponseModel rerunSeriesSingleResponseModel =
          await repository.fetchRerunSeriesSingle(
              body: rerunSeriesSingleRequestModel.toJson());

      emit(RerunSeriesSingleLoaded(
          rerunSeriesSingleResponseModel, event.playlistId, event.videoId));
    });
  }
}
