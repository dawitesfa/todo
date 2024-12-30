import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_demo/blocs/active_counter/active_counter_bloc.dart';
import 'package:todo_demo/pages/widgets/new_todo_field.dart';
import 'package:todo_demo/pages/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: Row(
            children: [
              Text('TODO'),
              Spacer(),
              Text(
                '${context.watch<ActiveCounterBloc>().state.activeCounter} items left',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: NewTodoField(),
          ),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}
