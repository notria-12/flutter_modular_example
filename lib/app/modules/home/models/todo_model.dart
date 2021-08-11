import 'dart:convert';

class TodoModel {
  String title;
  bool check;

  TodoModel({
    required this.title,
    required this.check,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'check': check,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'],
      check: map['check'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  @override
  String toString() => 'TodoModel(title: $title, check: $check)';
}
