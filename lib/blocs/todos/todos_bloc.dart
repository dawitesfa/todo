import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_demo/model/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosState.initial()) {
    on<AddTodoPressed>((event, emit) {
      final todo = Todo(desc: event.newDesc);
      emit(state.copyWith(todos: [...state.todos, todo]));
    });

    on<ToggleTodoPressed>((event, emit) {
      final newTodos = state.todos
          .map((todo) => todo.id == event.id
              ? todo.copyWith(completed: !todo.completed)
              : todo)
          .toList();
      emit(state.copyWith(todos: newTodos));
    });

    on<RemoveTodoPressed>((event, emit) {
      final newTodos =
          state.todos.where((todo) => todo.id != event.id).toList();
      emit(state.copyWith(todos: newTodos));
    });

    on<EditTodoDesc>((event, emit) {
      final newTodos = state.todos
          .map((todo) =>
              todo.id == event.id ? todo.copyWith(desc: event.newDesc) : todo)
          .toList();
      emit(state.copyWith(todos: newTodos));
    });
  }
}
