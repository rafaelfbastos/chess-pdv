
import 'package:chess_pdv/app/model/accommodation_model.dart';
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
  
}