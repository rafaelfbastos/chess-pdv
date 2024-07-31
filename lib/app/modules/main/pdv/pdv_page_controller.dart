import 'package:chess_pdv/app/model/pdv_model.dart';
import 'package:chess_pdv/app/modules/main/pdv_store.dart';
import 'package:mobx/mobx.dart';
part 'pdv_page_controller.g.dart';

class PdvPageController = PdvPageControllerBase with _$PdvPageController;

abstract class PdvPageControllerBase with Store {
  final PdvStore _pdvStore;
  
  PdvPageControllerBase({
    required PdvStore pdvStore,
  }) : _pdvStore = pdvStore;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @computed
  PdvModel get pdv => _pdvStore.selectedPdv!;


  
}
