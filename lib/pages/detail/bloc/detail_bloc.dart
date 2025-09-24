import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:my_quran/data/model/surat_detail_model.dart';
import 'package:my_quran/data/repository/detail_surat_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState()) {
    final detailSuratRepository = DetailSuratRepository();
    on<DetailEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetDetailSuratEvent>((event, emit) async {
      try {
        final dataDetailSurah = event.boxDetailSurah.get(event.idSurat);
        if (dataDetailSurah == null) {
          emit(state.copyWith(isLoading: true));
          final data = await detailSuratRepository.getDetailSurat(
            event.idSurat,
          );
          emit(state.copyWith(suratDetail: data));
          event.boxDetailSurah.put(event.idSurat, data);
          emit(state.copyWith(isLoading: false));
        } else {
          emit(state.copyWith(suratDetail: dataDetailSurah));
          log("Ini dari DataBase HIVE yaa");

        }
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
