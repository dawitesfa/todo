import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_demo/blocs/active_counter/active_counter_bloc.dart';
import 'package:todo_demo/blocs/filtered_todos/filtered_todos_bloc.dart';
import 'package:todo_demo/blocs/search_filter/search_filter_bloc.dart';
import 'package:todo_demo/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:todo_demo/blocs/todos/todos_bloc.dart';
import 'package:todo_demo/pages/home_page.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
          create: (context) => TodosBloc(),
        ),
        BlocProvider<ActiveCounterBloc>(
          create: (context) =>
              ActiveCounterBloc(todosBloc: context.read<TodosBloc>()),
        ),
        BlocProvider<TodoFilterBloc>(create: (context) => TodoFilterBloc()),
        BlocProvider<SearchFilterBloc>(create: (context) => SearchFilterBloc()),
        BlocProvider<FilteredTodosBloc>(
          create: (context) => FilteredTodosBloc(
            todosBloc: context.read<TodosBloc>(),
            todoFilterBloc: context.read<TodoFilterBloc>(),
            searchFilterBloc: SearchFilterBloc(),
          ),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
