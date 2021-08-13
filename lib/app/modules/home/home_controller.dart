import 'package:mobx/mobx.dart';
import 'package:modular_example/app/modules/home/models/todo_model.dart';

import 'package:modular_example/app/modules/home/repository/todo_repository_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoRepository repository;

  _HomeControllerBase(ITodoRepository this.repository) {
    getList();
  }

  @observable
  ObservableStream<List<TodoModel>>? todoList;

  @action
  getList() {
    todoList = repository.getTodos().asObservable();
  }
}
