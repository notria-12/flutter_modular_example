import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text('Ir para Home'),
            onPressed: () {
              Modular.to.pushNamed('/home');
            },
          ),
        ),
      ),
    );
  }
}
