part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetQuranEvent extends HomeEvent {
  Box<QuranListModel> boxSurat;
  GetQuranEvent({required this.boxSurat});
}

class GetDoaEvent extends HomeEvent {
  Box<DoaModel> boxDoa;
  GetDoaEvent({required this.boxDoa});
}

class GetJadwalSolatEvent extends HomeEvent {
  final String cityId;

  const GetJadwalSolatEvent({required this.cityId});
}

class SwitchToQuranEvent extends HomeEvent {}

class SwitchToDoaEvent extends HomeEvent {}
