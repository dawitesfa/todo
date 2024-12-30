// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todos_bloc.dart';

class TodosState extends Equatable {
  final List<Todo> todos;
  TodosState({
    required this.todos,
  });

  factory TodosState.initial() => TodosState(todos: []);

  @override
  List<Object> get props => [todos];

  TodosState copyWith({
    List<Todo>? todos,
  }) {
    return TodosState(
      todos: todos ?? this.todos,
    );
  }

  @override
  bool get stringify => true;
}
