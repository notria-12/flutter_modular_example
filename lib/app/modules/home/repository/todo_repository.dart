import 'package:modular_example/app/modules/home/models/todo_model.dart';
import 'package:modular_example/app/modules/home/repository/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  @override
  Stream<List<TodoModel>> getTodos() {
    throw UnimplementedError();
  }
}
