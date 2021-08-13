import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/modules/home/home_controller.dart';
import 'package:modular_example/app/modules/home/home_page.dart';
import 'package:modular_example/app/modules/home/repository/todo_repository.dart';
import 'package:modular_example/app/modules/home/repository/todo_repository_interface.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind<ITodoRepository>(
            (i) => TodoRepository(firestore: FirebaseFirestore.instance)),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, args) => HomePage())];
}
