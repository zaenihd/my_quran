// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Surat>? listSurat;
  final bool isLoading;
  final bool isDoa;
  final String error;

  const HomeState({
    this.listSurat,
    this.isLoading = false,
    this.error = "",
    this.isDoa = false,
  });

  @override
  List<Object?> get props => [listSurat, isDoa, isLoading,error];

  HomeState copyWith({
    List<Surat>? listSurat,
    bool? isLoading,
    bool? isDoa,
    String? error,
  }) {
    return HomeState(
      listSurat: listSurat ?? this.listSurat,
      isLoading: isLoading ?? this.isLoading,
      isDoa: isDoa ?? this.isDoa,
      error: error ?? this.error,
    );
  }
}
