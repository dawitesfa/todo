import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_demo/blocs/todos/todos_bloc.dart';

class NewTodoField extends StatefulWidget {
  const NewTodoField({
    super.key,
  });

  @override
  State<NewTodoField> createState() => _NewTodoFieldState();
}

class _NewTodoFieldState extends State<NewTodoField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'What to do?',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      controller: _controller,
      onSubmitted: (value) {
        if (value.isEmpty) return;
        _controller.clear();
        context.read<TodosBloc>().add(
              AddTodoPressed(
                newDesc: value.trim(),
              ),
            );
      },
    );
  }
}
