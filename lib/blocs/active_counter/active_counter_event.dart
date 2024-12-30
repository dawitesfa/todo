part of 'active_counter_bloc.dart';

sealed class ActiveCounterEvent extends Equatable {
  const ActiveCounterEvent();

  @override
  List<Object> get props => [];
}

class OnActiveTodoCounterUpdated extends ActiveCounterEvent {}
