import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/data/repository/quran_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    final quranRepo = QuranRepository();
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SwitchToDoaEvent>((event, emit) {
      emit(state.copyWith(isDoa: true));
    });

    on<SwitchToQuranEvent>((event, emit) {
      emit(state.copyWith(isDoa: false));
    });

    on<GetQuranEvent>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        List<Surat> surat = await quranRepo.getSurat();
        emit(state.copyWith(listSurat: surat));
        emit(state.copyWith(isLoading: false));
        log("berhasil");
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
        log("message == $e");
      }
    });
  }
}
