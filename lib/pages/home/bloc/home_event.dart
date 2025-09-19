part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetQuranEvent extends HomeEvent {
   Box<QuranListModel> boxSurat;
  GetQuranEvent({
    required this.boxSurat,
  });
}
class SwitchToQuranEvent extends HomeEvent {}
class SwitchToDoaEvent extends HomeEvent {}
