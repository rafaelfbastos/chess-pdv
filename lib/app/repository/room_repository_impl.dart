import 'package:chess_pdv/app/core/excepition/fetch_exception.dart';
import 'package:chess_pdv/app/model/accommodation_model.dart';
import 'package:chess_pdv/app/model/room_exibhition_model.dart';
import 'package:chess_pdv/app/repository/room_repository.dart';
import 'package:dio/dio.dart';

class RoomRepositoryImpl implements RoomRepository {
  final Dio _dio;

  RoomRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<RoomExibhitionModel>> fetchBusyRooms() async {
    try {
      final response = await _dio.get('/helper/get_rooms/ocupado');

      if (response.statusCode != 200) {
        throw FetchException(message: 'Error no servidor');
      }
      List<RoomExibhitionModel> rooms = [];

      for (var item in response.data) {
        rooms.add(RoomExibhitionModel.fromMap(item));
      }

      return rooms;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AccommodationModel> currentAccommodation(int id) async {
    try {
      final response = await _dio.post(
          '/manager_room/get_current_accommodation',
          data: {'accommodation_id': id});

      if (response.statusCode != 200) {
        throw FetchException(message: 'Error no servidor');
      }

      return AccommodationModel.fromMap(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
