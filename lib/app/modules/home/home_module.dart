import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, args) => HomePage())];
}
