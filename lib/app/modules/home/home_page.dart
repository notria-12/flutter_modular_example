import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:modular_example/app/modules/home/home_controller.dart';
import 'package:modular_example/app/modules/home/models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Observer(
        builder: (context) {
          if (controller.todoList!.hasError) {
            return Center(
              child: ElevatedButton(
                onPressed: controller.getList(),
                child: Text('Error'),
              ),
            );
          }

          if (controller.todoList!.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<TodoModel> list = controller.todoList!.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              TodoModel todoModel = list[index];
              return CheckboxListTile(
                value: todoModel.check,
                onChanged: (checked) {
                  todoModel.check = checked!;
                  todoModel.save();
                },
                title: Text(todoModel.title),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
