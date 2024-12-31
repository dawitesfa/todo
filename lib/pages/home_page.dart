import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_demo/blocs/blocs.dart';
import 'package:todo_demo/model/todo.dart';
import 'package:todo_demo/pages/widgets/new_todo_field.dart';
import 'package:todo_demo/pages/widgets/padded_container.dart';
import 'package:todo_demo/pages/widgets/search_bar.dart';
import 'package:todo_demo/pages/widgets/todo_list.dart';
import 'package:todo_demo/utilities/utility.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        centerTitle: false,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              textStyle: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onPressed: () {
              context.read<TodoFilterBloc>().add(
                    OnFilterTabPressed(newFilter: Filter.active),
                  );
            },
            child: Text(
              '${context.watch<ActiveCounterBloc>().state.activeCounter} items left',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          PaddedContainer(child: NewTodoField()),
          Gaps.v10,
          PaddedContainer(child: CustomSearchBar()),
          Gaps.v10,
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}
