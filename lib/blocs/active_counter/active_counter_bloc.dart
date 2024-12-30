// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_demo/blocs/todos/todos_bloc.dart';

part 'active_counter_event.dart';
part 'active_counter_state.dart';

class ActiveCounterBloc extends Bloc<ActiveCounterEvent, ActiveCounterState> {
  final TodosBloc todosBloc;
  late final StreamSubscription _streamSubscription;
  int _activeCounter = 0;
  ActiveCounterBloc({
    required this.todosBloc,
  }) : super(ActiveCounterState.initial()) {
    _streamSubscription = todosBloc.stream.listen(
      (todosState) {
        _activeCounter =
            todosState.todos.where((todo) => !todo.completed).toList().length;
        this.add(OnActiveTodoCounterUpdated());
      },
    );
    on<OnActiveTodoCounterUpdated>((event, emit) {
      emit(state.copyWith(activeCounter: _activeCounter));
    });
  }
  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
