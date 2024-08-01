import 'package:chess_pdv/app/core/config/auth_guard.dart';
import 'package:chess_pdv/app/core/helpers/environment.dart';
import 'package:chess_pdv/app/core/store/auth_store.dart';
import 'package:chess_pdv/app/modules/auth/auth_module.dart';
import 'package:chess_pdv/app/modules/main/main_module.dart';
import 'package:chess_pdv/app/pages/page_404.dart';
import 'package:chess_pdv/app/pages/spash_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio(
              BaseOptions(
                baseUrl: Environment.baseUrl,
              ),
            )),
        Bind.singleton((i) => AuthStore(dio: i())..loadBoxes()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/spash',
            child: (context, args) => SpashPage(
                  authStore: context.read(),
                )),
        ModuleRoute('/', module: MainModule(), guards: [AuthGuard()]),
        ModuleRoute('/auth', module: AuthModule()),
        WildcardRoute(child: (context, args) => const Page404()),
      ];
}
