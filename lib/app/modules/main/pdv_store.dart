// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chess_pdv/app/services/pdv_service.dart';
import 'package:chess_pdv/app/services/room_service.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import 'package:chess_pdv/app/model/pdv_model.dart';

part 'pdv_store.g.dart';

class PdvStore = PdvStoreBase with _$PdvStore;

abstract class PdvStoreBase with Store {
  late Box _pdvBox;
  final PdvService _pdvService;
  final RoomService _roomService;

  @observable
  bool isLoading = false;

  @observable
  String error = '';

  @observable
  ObservableList<String>  guestAcommodation = ObservableList<String>();

  @observable
  PdvModel? selectedPdv;

  @observable
  ObservableList<PdvModel> pdvList = ObservableList<PdvModel>();

  PdvStoreBase(
      {required PdvService pdvService, required RoomService roomService})
      : _roomService = roomService,
        _pdvService = pdvService {
    _pdvBox = Hive.box<PdvModel>('pdv');
  }

  @action
  void loadStoredPdv() {
    selectedPdv = _pdvBox.values.firstOrNull;
  }

  @action
  Future<void> loadPdvs() async {
    pdvList.clear();
    isLoading = true;
    try {
      final pdvs = await _pdvService.fetchAll();
      pdvList.addAll(pdvs);
    } catch (e) {
      error = 'Error no servidor';
    } finally {
      isLoading = false;
    }
  }
  Future<void> loadGuestAcommodation() async {
    isLoading = true;
    try {
      final list = await _roomService.fetchGuestAcommodation();
      guestAcommodation.addAll(list);
    } catch (e) {
      error = 'Error no servidor';
    } finally {
      isLoading = false;
    }
  }

  @action
  selectPdv(PdvModel pdv) {
    selectedPdv = pdv;
    _pdvBox.put('pdv', pdv);
  }

  @action
  clearSelectedPdv() {
    selectedPdv = null;
    _pdvBox.delete('pdv');
  }

  @action
  setError(String value) => error = value;

  loadAll() async {
    loadStoredPdv();
    await Future.wait([loadPdvs(), loadGuestAcommodation()]);
  
  }
}
