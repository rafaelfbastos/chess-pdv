import 'package:chess_pdv/app/modules/main/pdv/pdv_page.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:chess_pdv/app/modules/main/pdv_store.dart';
import 'package:chess_pdv/app/modules/main/select_pdv/select_pdv_page.dart';
import 'package:chess_pdv/app/repository/pdv_repository.dart';
import 'package:chess_pdv/app/repository/pdv_repository_impl.dart';
import 'package:chess_pdv/app/repository/product_repository.dart';
import 'package:chess_pdv/app/repository/product_repository_impl.dart';
import 'package:chess_pdv/app/services/pdv_service.dart';
import 'package:chess_pdv/app/services/pdv_service_impl.dart';
import 'package:chess_pdv/app/services/product_service.dart';
import 'package:chess_pdv/app/services/product_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<PdvRepository>((i) => PdvRepositoryImpl(dio: i())),
        Bind<PdvService>((i) => PdvServiceImpl(pdvRepository: i())),
        Bind.singleton<PdvStore>((i) => PdvStore(pdvService: i())
          ..loadStoredPdv()
          ..loadPdvs()),
        Bind<ProductRepository>((i)=> ProductRepositoryImpl(dio: i())),
        Bind<ProductService>((i)=>ProductServiceImpl(productRepository: i())),
        Bind<PdvPageController>(
          (i) => PdvPageController(pdvStore: i(), productService: i()),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/select-pdv',
            child: (context, args) => LoaderOverlay(
                  child: SelectPdvPage(
                    pdvStore: context.read(),
                  ),
                )),
        ChildRoute('/',
            child: (context, args) => LoaderOverlay(
                  child: PdvPage(
                    controller: context.read(),
                  ),
                ))
      ];
}
