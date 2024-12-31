// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'empty_list_bloc.dart';

class EmptyListState extends Equatable {
  final bool isEmpty;
  final String text;
  final bool askAdd;
  EmptyListState({
    required this.isEmpty,
    required this.text,
    required this.askAdd,
  });

  factory EmptyListState.initial() => EmptyListState(
        isEmpty: true,
        text: 'Empty List',
        askAdd: false,
      );

  @override
  List<Object> get props => [isEmpty, text, askAdd];

  EmptyListState copyWith({
    bool? isEmpty,
    String? text,
    bool? askAdd,
  }) {
    return EmptyListState(
      isEmpty: isEmpty ?? this.isEmpty,
      text: text ?? this.text,
      askAdd: askAdd ?? this.askAdd,
    );
  }

  @override
  bool get stringify => true;
}
