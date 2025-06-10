import 'package:MONO29/core/utils/log.dart';
import 'package:MONO29/features/live/data/models/video_stream_response_model.dart';
import 'package:MONO29/features/live/domain/repositories/live_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'live_event.dart';
part 'live_state.dart';

class LiveBloc extends Bloc<LiveEvent, LiveState> {
  final LiveRepository repository;

  LiveBloc(this.repository) : super(LiveInitial()) {
    on<FetchLiveStream>((event, emit) async {
      emit(LiveLoading());
      try {
        final result = await repository.fetchStreamFeed();
        printLog(result.toString());
        emit(LiveLoaded(result));
      } catch (e) {
        emit(LiveError(e.toString()));
      }
    });

    on<ReplayStream>((event, emit) {
      // ถ้าอยากให้ replay ทำอะไร สามารถเขียนที่นี่
      // ตัวอย่าง: รีเฟรช stream (เรียก fetchStreamFeed ใหม่)
      add(FetchLiveStream());
    });

    on<ChangeLanguage>((event, emit) {
      final currentState = state;
      if (currentState is LiveLoaded) {
        emit(LiveLoaded(
          currentState.videoStreamResponse,
          selectedLanguage: event.language,
          selectedQuality: currentState.selectedQuality,
        ));
      }
    });

    on<ChangeQuality>((event, emit) {
      final currentState = state;
      if (currentState is LiveLoaded) {
        emit(LiveLoaded(
          currentState.videoStreamResponse,
          selectedLanguage: currentState.selectedLanguage,
          selectedQuality: event.quality,
        ));
      }
    });
  }
}
