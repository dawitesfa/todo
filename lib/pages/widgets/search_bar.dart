import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_demo/blocs/search_filter/search_filter_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(
          4.0,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'search',
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          context.read<SearchFilterBloc>().add(
                OnSearchTermChanged(newSearchTerm: value),
              );
        },
      ),
    );
  }
}
