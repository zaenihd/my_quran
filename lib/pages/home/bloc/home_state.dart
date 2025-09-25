// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Surat>? listSurat;
  final List<Doa>? listDoa;
  final JadwalSolatModel? jadwalSolat;
  final bool isLoading;
  final bool isDoa;
  final String error;

  const HomeState({
    this.listSurat,
    this.listDoa,
    this.jadwalSolat,
    this.isLoading = false,
    this.isDoa = false,
    this.error = "",
  });

  @override
  List<Object?> get props => [listSurat, listDoa, isDoa, isLoading, error, jadwalSolat];

  HomeState copyWith({
    List<Surat>? listSurat,
    List<Doa>? listDoa,
    JadwalSolatModel? jadwalSolat,
    bool? isLoading,
    bool? isDoa,
    String? error,
  }) {
    return HomeState(
      listSurat: listSurat ?? this.listSurat,
      listDoa: listDoa ?? this.listDoa,
      jadwalSolat: jadwalSolat ?? this.jadwalSolat,
      isLoading: isLoading ?? this.isLoading,
      isDoa: isDoa ?? this.isDoa,
      error: error ?? this.error,
    );
  }
}
