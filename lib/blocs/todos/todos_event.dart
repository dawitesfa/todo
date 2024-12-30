// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todos_bloc.dart';

sealed class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class AddTodoPressed extends TodosEvent {
  final String newDesc;
  AddTodoPressed({
    required this.newDesc,
  });

  @override
  List<Object> get props => [newDesc];
}

class ToggleTodoPressed extends TodosEvent {
  final String id;
  ToggleTodoPressed({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class RemoveTodoPressed extends TodosEvent {
  final String id;
  RemoveTodoPressed({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class EditTodoDesc extends TodosEvent {
  final String id;
  final String newDesc;
  EditTodoDesc({
    required this.id,
    required this.newDesc,
  });

  @override
  List<Object> get props => [id, newDesc];
}
