// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_demo/blocs/filtered_todos/filtered_todos_bloc.dart';
import 'package:todo_demo/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:todo_demo/model/todo.dart';

part 'empty_list_event.dart';
part 'empty_list_state.dart';

class EmptyListBloc extends Bloc<EmptyListEvent, EmptyListState> {
  final FilteredTodosBloc filteredTodosBloc;
  final TodoFilterBloc todoFilterBloc;
  late final StreamSubscription _filteredtodosSubscription;
  late final StreamSubscription _todoFilterSubscription;

  EmptyListBloc({
    required this.filteredTodosBloc,
    required this.todoFilterBloc,
  }) : super(EmptyListState.initial()) {
    _filteredtodosSubscription = filteredTodosBloc.stream.listen((_) {
      this.add(OnEmptyListUpdateEvent());
    });
    _todoFilterSubscription = todoFilterBloc.stream.listen((_) {
      this.add(OnEmptyListUpdateEvent());
    });
    on<OnEmptyListUpdateEvent>((event, emit) {
      String text = '';
      bool isEmpty = filteredTodosBloc.state.filteredTodos.isEmpty;
      bool showAdd = false;
      if (isEmpty) {
        switch (todoFilterBloc.state.todoFilter) {
          case Filter.active:
            text = 'No active tasks';
            showAdd = false;
            break;
          case Filter.completed:
            text = 'No completed tasks';
            showAdd = false;
            break;
          case Filter.all:
          default:
            text = "Empty List";
            showAdd = true;
            break;
        }
      }

      emit(state.copyWith(
        isEmpty: isEmpty,
        text: text,
        askAdd: showAdd,
      ));
    });
  }
  @override
  Future<void> close() {
    _filteredtodosSubscription.cancel();
    _todoFilterSubscription.cancel();
    return super.close();
  }
}
