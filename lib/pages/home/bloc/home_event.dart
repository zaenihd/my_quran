part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetQuranEvent extends HomeEvent {}
class SwitchToQuranEvent extends HomeEvent {}
class SwitchToDoaEvent extends HomeEvent {}
