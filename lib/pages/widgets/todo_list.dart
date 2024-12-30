import 'package:flutter/material.dart';
import 'package:todo_demo/blocs/filtered_todos/filtered_todos_bloc.dart';
import 'package:todo_demo/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:todo_demo/blocs/todos/todos_bloc.dart';
import 'package:todo_demo/model/todo.dart';
import 'package:todo_demo/pages/widgets/todo_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  elevation: 0,
                  backgroundColor:
                      context.watch<TodoFilterBloc>().state.todoFilter ==
                              Filter.all
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.transparent,
                ),
                onPressed: () {
                  context
                      .read<TodoFilterBloc>()
                      .add(OnFilterTabPressed(newFilter: Filter.all));
                },
                child: Text('All'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  elevation: 0,
                  backgroundColor:
                      context.watch<TodoFilterBloc>().state.todoFilter ==
                              Filter.active
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.transparent,
                ),
                onPressed: () {
                  context
                      .read<TodoFilterBloc>()
                      .add(OnFilterTabPressed(newFilter: Filter.active));
                },
                child: Text('Active'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  elevation: 0,
                  backgroundColor:
                      context.watch<TodoFilterBloc>().state.todoFilter ==
                              Filter.completed
                          ? Colors.grey.withOpacity(0.5)
                          : Colors.transparent,
                ),
                onPressed: () {
                  context
                      .read<TodoFilterBloc>()
                      .add(OnFilterTabPressed(newFilter: Filter.completed));
                },
                child: Text('Completed'),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount:
                context.watch<FilteredTodosBloc>().state.filteredTodos.length,
            itemBuilder: (context, index) {
              return TodoItem(
                todo: context
                    .watch<FilteredTodosBloc>()
                    .state
                    .filteredTodos[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
