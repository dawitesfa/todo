// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_demo/blocs/search_filter/search_filter_bloc.dart';
import 'package:todo_demo/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:todo_demo/blocs/todos/todos_bloc.dart';
import 'package:todo_demo/model/todo.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  final TodosBloc todosBloc;
  final SearchFilterBloc searchFilterBloc;
  final TodoFilterBloc todoFilterBloc;

  late final StreamSubscription todosSubscription;
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription tsearchFilterSubscription;

  FilteredTodosBloc({
    required this.todosBloc,
    required this.searchFilterBloc,
    required this.todoFilterBloc,
  }) : super(FilteredTodosState.initial()) {
    todosSubscription = todosBloc.stream.listen((todosState) {
      this.add(OnFilteredTodosEvent());
    });

    todoFilterSubscription = todoFilterBloc.stream.listen((todoFilterState) {
      this.add(OnFilteredTodosEvent());
    });

    tsearchFilterSubscription = searchFilterBloc.stream.listen((searchState) {
      this.add(OnFilteredTodosEvent());
    });

    on<OnFilteredTodosEvent>((event, emit) {
      List<Todo> filteredTodos = [];
      switch (todoFilterBloc.state.todoFilter) {
        case Filter.active:
          filteredTodos =
              todosBloc.state.todos.where((todo) => !todo.completed).toList();
          break;
        case Filter.completed:
          filteredTodos =
              todosBloc.state.todos.where((todo) => todo.completed).toList();
          break;
        case Filter.all:
        default:
          filteredTodos = todosBloc.state.todos;
          break;
      }
      if (searchFilterBloc.state.searchTerm.isNotEmpty) {
        filteredTodos = filteredTodos
            .where((todo) => todo.desc
                .toLowerCase()
                .contains(searchFilterBloc.state.searchTerm.toLowerCase()))
            .toList();
      }
      emit(state.copyWith(filteredTodos: filteredTodos));
    });
  }

  @override
  Future<void> close() {
    todosSubscription.cancel();
    todoFilterSubscription.cancel();
    tsearchFilterSubscription.cancel();
    return super.close();
  }
}
