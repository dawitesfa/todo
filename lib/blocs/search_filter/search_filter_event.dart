// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_filter_bloc.dart';

sealed class SearchFilterEvent extends Equatable {
  const SearchFilterEvent();

  @override
  List<Object> get props => [];
}

class OnSearchTermChanged extends SearchFilterEvent {
  final String newSearchTerm;
  OnSearchTermChanged({
    required this.newSearchTerm,
  });

  @override
  List<Object> get props => [newSearchTerm];
}
