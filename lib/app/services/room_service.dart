import 'package:chess_pdv/app/model/accommodation_model.dart';
import 'package:chess_pdv/app/model/room_exibhition_model.dart';

abstract class RoomService {
  Future<List<RoomExibhitionModel>> fetchBusyRooms();
  Future<AccommodationModel> currentAccommodation(int id);
}