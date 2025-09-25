import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:my_quran/data/model/doa_model.dart';
import 'package:my_quran/data/model/jadwal_solat.dart';
import 'package:my_quran/data/model/quran_list_model.dart';
import 'package:my_quran/data/repository/quran_repository.dart';
import 'package:my_quran/helper/hive/hive_const.dart';

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
      // event.boxSurat.delete(QuranBoxName.suratBox);
      final suratData = event.boxSurat.get(QuranBoxName.quranBox);
      emit(state.copyWith(isLoading: true));
      if (suratData == null) {
        try {
          QuranListModel result = await quranRepo.getSurat();
          emit(state.copyWith(listSurat: result.data));
          event.boxSurat.put(QuranBoxName.quranBox, result);
          emit(state.copyWith(isLoading: false));
          log("ini dari API Looh");
        } catch (e) {
          emit(state.copyWith(error: e.toString()));
          emit(state.copyWith(isLoading: false));
        }
      } else {
        // event.boxSurat.delete('suratData');
        emit(state.copyWith(listSurat: suratData.data));
        emit(state.copyWith(isLoading: false));
        log("ini dari Database looh");
      }
    });

    on<GetJadwalSolatEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        JadwalSolatModel result = await quranRepo.getJadwalSolat(
          cityId: event.cityId,
        );
        emit(state.copyWith(jadwalSolat: result));
        emit(state.copyWith(isLoading: false));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
        emit(state.copyWith(isLoading: false));
        log("gagal $e");
      }
    });

    on<GetDoaEvent>((event, emit) async {
      // event.boxSurat.delete(QuranBoxName.suratBox);
      final doaData = event.boxDoa.get(QuranBoxName.doaBox);
      emit(state.copyWith(isLoading: true));
      if (doaData == null) {
        try {
          DoaModel result = await quranRepo.getDoa();
          emit(state.copyWith(listDoa: result.data));
          event.boxDoa.put(QuranBoxName.doaBox, result);
          emit(state.copyWith(isLoading: false));
          log("ini dari API");
        } catch (e) {
          emit(state.copyWith(error: e.toString()));
          emit(state.copyWith(isLoading: false));
        }
      } else {
        // event.boxSurat.delete('doaData');
        emit(state.copyWith(listDoa: doaData.data));
        emit(state.copyWith(isLoading: false));
        log("ini dari Database");
      }
    });
  }
}
