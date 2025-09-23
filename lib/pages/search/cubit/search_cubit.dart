import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_quran/data/model/quran_list_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  void getSearchSurat(String searcC, List<Surat> surat) {
    final resulSearch = surat
        .where(
          (element) =>
              element.namaLatin!.toLowerCase().contains(searcC.toLowerCase()),
        )
        .toList();
    // state.searchResult = resulSearch;
    emit(state.copyWith(searchResult: resulSearch));
  }
}
