// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<Surat>? surat;
   List<Surat>? searchResult;
  final String seachController;

   SearchState({this.surat, this.seachController = "", this.searchResult});

  @override
  List<Object?> get props => [surat, searchResult, seachController];

  SearchState copyWith({
    List<Surat>? surat,
    List<Surat>? searchResult,
    String? seachController,
  }) {
    return SearchState(
      surat: surat ?? this.surat,
      searchResult: searchResult ?? this.searchResult,
      seachController: seachController ?? this.seachController,
    );
  }
}
