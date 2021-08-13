import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
              return ListTile(
                title: Text(todoModel.title),
                onTap: () {
                  _showDialog(model: todoModel);
                },
                leading: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    todoModel.delete();
                  },
                ),
                trailing: Checkbox(
                  value: todoModel.check,
                  onChanged: (checked) {
                    todoModel.check = checked!;
                    todoModel.save();
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showDialog,
      ),
    );
  }

  _showDialog({TodoModel? model}) {
    model ??= TodoModel(title: '', check: false);
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Modular.to.pop();
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.redAccent),
                    )),
                TextButton(
                    onPressed: () async {
                      await model!.save();
                      Modular.to.pop();
                    },
                    child: Text(
                      'Adicionar',
                      style: TextStyle(color: Colors.greenAccent),
                    ))
              ],
              title: Text(model!.title.isEmpty ? 'Adicionar novo' : 'Editar'),
              content: TextFormField(
                  initialValue: model!.title,
                  onChanged: (value) => model!.title = value,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'escreva..')));
        });
  }
}
