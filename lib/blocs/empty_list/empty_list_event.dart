part of 'empty_list_bloc.dart';

sealed class EmptyListEvent extends Equatable {
  const EmptyListEvent();

  @override
  List<Object> get props => [];
}

class OnEmptyListUpdateEvent extends EmptyListEvent {}
