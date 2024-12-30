// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_filter_bloc.dart';

class TodoFilterState extends Equatable {
  final Filter todoFilter;
  TodoFilterState({
    required this.todoFilter,
  });

  factory TodoFilterState.initial() => TodoFilterState(todoFilter: Filter.all);

  @override
  List<Object> get props => [todoFilter];

  TodoFilterState copyWith({
    Filter? todoFilter,
  }) {
    return TodoFilterState(
      todoFilter: todoFilter ?? this.todoFilter,
    );
  }

  @override
  bool get stringify => true;
}
