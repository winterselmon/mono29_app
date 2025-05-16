import 'package:MONO29/features/prnews/data/models/prnews_response_model.dart';
import 'package:MONO29/features/prnews/domain/repositories/prnews_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'prnews_event.dart';
part 'prnews_state.dart';

class PrnewsBloc extends Bloc<PrnewsEvent, PrnewsState> {
  final PrnewsRepository repository;

  PrnewsBloc(this.repository) : super(PrnewsInitial()) {
    on<PrnewsEvent>((event, emit) {});

    on<FetchPrnewsEvent>((event, emit) async {
      emit(PrnewLoading());
      try {
        final result = await repository.fetchPrnews();
        emit(PrnewsLoaded(result));
      } catch (e) {
        emit(PrnewsError(e.toString()));
      }
    });
  }
}
