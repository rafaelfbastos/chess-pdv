import 'package:chess_pdv/app/model/accommodation_item_removed_model.dart';
import 'package:chess_pdv/app/model/accommodation_model.dart';
import 'package:chess_pdv/app/model/product_model.dart';
import 'package:chess_pdv/app/model/room_exibhition_model.dart';
import 'package:chess_pdv/app/repository/room_repository.dart';
import 'package:chess_pdv/app/services/room_service.dart';

class RoomServiceImpl implements RoomService {
  final RoomRepository _roomRepository;

  RoomServiceImpl({required RoomRepository roomRepository})
      : _roomRepository = roomRepository;

  @override
  Future<List<RoomExibhitionModel>> fetchBusyRooms() async {
    try {
      return await _roomRepository.fetchBusyRooms();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AccommodationModel> currentAccommodation(int id) {
    try {
      return _roomRepository.currentAccommodation(id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateAccommodationProdutcs(
      AccommodationModel accommodation, List<ProductModel> products) {
    try {
      return _roomRepository.updateAccommodationProdutcs(
          accommodation, products);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<String>> fetchGuestAcommodation(){
    try {
      return _roomRepository.fetchGuestAcommodation();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> removeProductFromAccommodation(AccommodationItemRemovedModel removed) {
    try {
      return _roomRepository.removeProductFromAccommodation(removed);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
