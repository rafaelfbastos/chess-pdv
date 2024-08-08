import 'package:chess_pdv/app/model/accommodation_item_removed_model.dart';
import 'package:chess_pdv/app/model/accommodation_model.dart';
import 'package:chess_pdv/app/model/product_model.dart';
import 'package:chess_pdv/app/model/room_exibhition_model.dart';

abstract class RoomRepository {
  Future<List<RoomExibhitionModel>> fetchBusyRooms();
  Future<AccommodationModel> currentAccommodation(int id);
  Future<void> updateAccommodationProdutcs(AccommodationModel accommodation, List<ProductModel> products);
  Future<List<String>> fetchGuestAcommodation();
  Future<void> removeProductFromAccommodation(AccommodationItemRemovedModel removed);
}