import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:modular_example/app/modules/home/models/todo_model.dart';
import 'package:modular_example/app/modules/home/repository/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  FirebaseFirestore firestore;

  TodoRepository({
    required this.firestore,
  });

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore.collection('todo').snapshots().map((query) {
      return query.docs.map((doc) {
        return TodoModel.fromMap(doc);
      }).toList();
    });
  }
}
