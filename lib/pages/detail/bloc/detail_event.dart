part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailSuratEvent extends DetailEvent{
  final String idSurat;
  final Box<SuratDetailModel> boxDetailSurah;
  const GetDetailSuratEvent({required this.idSurat, required this.boxDetailSurah});
}
