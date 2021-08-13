import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  bool check;
  DocumentReference? reference;

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

  Future save() async {
    //TODO: procurar melhor arquitetura pra colocar este método
    if (reference == null) {
      reference = await FirebaseFirestore.instance
          .collection('todo')
          .add({'title': title, 'check': check});
    } else {
      reference!.update({'title': title, 'check': check});
    }
  }

  Future delete() {
    return reference!.delete();
  }

  @override
  String toString() => 'TodoModel(title: $title, check: $check)';
}
