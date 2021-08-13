import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  bool check;
  final DocumentReference? reference;

  TodoModel({
    required this.title,
    required this.check,
    this.reference,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'check': check,
    };
  }

  factory TodoModel.fromMap(DocumentSnapshot doc) {
    return TodoModel(
      title: doc['title'],
      check: doc['check'],
      reference: doc.reference,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  save() {
    if (reference == null) {
    } else {
      reference!.update({'title': title, 'check': check});
    }
  }

  @override
  String toString() => 'TodoModel(title: $title, check: $check)';
}
