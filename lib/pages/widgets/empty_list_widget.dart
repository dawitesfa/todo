import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_demo/blocs/empty_list/empty_list_bloc.dart';
import 'package:todo_demo/utilities/utility.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Gaps.v24,
          Text('${context.watch<EmptyListBloc>().state.text}'),
          Gaps.v10,
          if (context.watch<EmptyListBloc>().state.askAdd)
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('Add Task'),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_task),
                Gaps.h16,
                Text('Add tasks and be more productive.'),
              ],
            ),
        ],
      ),
    );
  }
}
