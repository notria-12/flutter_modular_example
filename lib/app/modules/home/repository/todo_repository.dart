import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modular_example/app/modules/home/models/todo_model.dart';
import 'package:modular_example/app/modules/home/repository/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<TodoModel>> getTodos() {
    return _firestore.collection('todo').snapshots().map((query) {
      return query.docs.map((doc) {
        return TodoModel.fromMap(doc.data());
      }).toList();
    });
  }
}
