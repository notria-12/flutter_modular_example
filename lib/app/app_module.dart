import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/modules/home/home_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [ModuleRoute('/home', module: HomeModule())];
}
