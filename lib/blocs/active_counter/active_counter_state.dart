// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'active_counter_bloc.dart';

class ActiveCounterState extends Equatable {
  final int activeCounter;
  ActiveCounterState({
    required this.activeCounter,
  });

  factory ActiveCounterState.initial() => ActiveCounterState(activeCounter: 0);

  @override
  List<Object> get props => [activeCounter];

  ActiveCounterState copyWith({
    int? activeCounter,
  }) {
    return ActiveCounterState(
      activeCounter: activeCounter ?? this.activeCounter,
    );
  }

  @override
  bool get stringify => true;
}
