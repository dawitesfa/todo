// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

enum Filter {
  all,
  active,
  completed,
}

class Todo extends Equatable {
  final String id;
  final String desc;
  final bool completed;
  Todo({
    String? id,
    required this.desc,
    this.completed = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, desc, completed];

  Todo copyWith({
    String? id,
    String? desc,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      completed: completed ?? this.completed,
    );
  }

  @override
  bool get stringify => true;
}
