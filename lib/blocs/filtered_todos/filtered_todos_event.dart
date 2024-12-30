part of 'filtered_todos_bloc.dart';

sealed class FilteredTodosEvent extends Equatable {
  const FilteredTodosEvent();

  @override
  List<Object> get props => [];
}

class OnFilteredTodosEvent extends FilteredTodosEvent {}
