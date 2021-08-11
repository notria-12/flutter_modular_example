import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/modules/home/home_module.dart';
import 'package:modular_example/app/modules/login/login_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/login', child: (_, args) => LoginPage())
      ];
}
