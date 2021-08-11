import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text('Ir para Login'),
            onPressed: () {
              Modular.to.pushNamed('/login');
            },
          ),
        ),
      ),
    );
  }
}
