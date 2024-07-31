import 'package:chess_pdv/app/modules/main/pdv/pdv_page.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:chess_pdv/app/modules/main/pdv_store.dart';
import 'package:chess_pdv/app/modules/main/select_pdv/select_pdv_page.dart';
import 'package:chess_pdv/app/repository/pdv_repository.dart';
import 'package:chess_pdv/app/repository/pdv_repository_impl.dart';
import 'package:chess_pdv/app/services/pdv_service.dart';
import 'package:chess_pdv/app/services/pdv_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<PdvRepository>(
            (i) => PdvRepositoryImpl(dio: i.get(), authStore: i.get())),
        Bind<PdvService>((i) => PdvServiceImpl(pdvRepository: i.get())),
        Bind.singleton<PdvStore>((i) => PdvStore(pdvService: i())
          ..loadStoredPdv()
          ..loadPdvs()),
        Bind<PdvPageController>(
          (i) => PdvPageController(pdvStore: i()),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/select-pdv',
            child: (context, args) => SelectPdvPage(
                  pdvStore: context.read(),
                )),
        ChildRoute('/',
            child: (context, args) => PdvPage(
                  controller: context.read(),
                ))
      ];
}
