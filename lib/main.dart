import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_demo/blocs/blocs.dart';
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
            searchFilterBloc: context.read<SearchFilterBloc>(),
          ),
        ),
        BlocProvider(
          create: (context) => EmptyListBloc(
            filteredTodosBloc: context.read<FilteredTodosBloc>(),
            todoFilterBloc: context.read<TodoFilterBloc>(),
          ),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
