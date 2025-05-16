import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hightlight_event.dart';
part 'hightlight_state.dart';

class HightlightBloc extends Bloc<HightlightEvent, HightlightState> {
  HightlightBloc() : super(HightlightInitial()) {
    on<HightlightEvent>((event, emit) {});

    on<HLSetCurrentPageEvent>((event, emit) {
      emit(HLSetCurrentPageState(event.currentPage));
    });

    on<HLSetIsContactEvent>((event, emit) {
      emit(HLSetIsContactState(event.isContact));
    });
  }
}
