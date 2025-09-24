// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_bloc.dart';

class DetailState extends Equatable {
  final SuratDetailModel? suratDetail;
  final bool isLoading;
  final String error;

  const DetailState({this.suratDetail, this.isLoading = false, this.error = ""});

  @override
  List<Object?> get props => [suratDetail, isLoading, error];

  DetailState copyWith({
    SuratDetailModel? suratDetail,
    bool? isLoading,
    String? error,
  }) {
    return DetailState(
      suratDetail: suratDetail ?? this.suratDetail,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
