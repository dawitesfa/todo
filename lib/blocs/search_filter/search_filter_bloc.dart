import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_filter_event.dart';
part 'search_filter_state.dart';

class SearchFilterBloc extends Bloc<SearchFilterEvent, SearchFilterState> {
  SearchFilterBloc() : super(SearchFilterState.initial()) {
    on<OnSearchTermChanged>((event, emit) {
      emit(state.copyWith(searchTerm: event.newSearchTerm));
    });
  }
}
