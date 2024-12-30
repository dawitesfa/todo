// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_demo/blocs/todos/todos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_demo/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) {
        context.read<TodosBloc>().add(RemoveTodoPressed(id: todo.id));
      },
      key: GlobalKey(debugLabel: todo.id),
      background: Container(
        color: Colors.red,
        child: Center(child: Text('Cannot be undone')),
      ),
      confirmDismiss: (_) async {
        return await Future.delayed(const Duration(seconds: 2), () {
          return true;
        });
      },
      child: CheckboxListTile.adaptive(
        title: Text(todo.desc),
        subtitle: Text('todo'),
        controlAffinity: ListTileControlAffinity.leading,
        value: todo.completed,
        onChanged: (value) {
          context.read<TodosBloc>().add(ToggleTodoPressed(id: todo.id));
        },
      ),
    );
  }
}
