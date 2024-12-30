// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'search_filter_bloc.dart';

class SearchFilterState extends Equatable {
  final String searchTerm;
  SearchFilterState({
    required this.searchTerm,
  });

  factory SearchFilterState.initial() => SearchFilterState(searchTerm: '');
  @override
  List<Object> get props => [searchTerm];

  SearchFilterState copyWith({
    String? searchTerm,
  }) {
    return SearchFilterState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  bool get stringify => true;
}
