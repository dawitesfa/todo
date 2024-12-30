import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_demo/model/todo.dart';

part 'todo_filter_event.dart';
part 'todo_filter_state.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterState.initial()) {
    on<OnFilterTabPressed>((event, emit) {
      emit(state.copyWith(todoFilter: event.newFilter));
    });
  }
}
