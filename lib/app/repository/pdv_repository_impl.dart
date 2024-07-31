
import 'package:chess_pdv/app/core/store/auth_store.dart';
import 'package:chess_pdv/app/model/pdv_model.dart';
import 'package:chess_pdv/app/repository/pdv_repository.dart';
import 'package:dio/dio.dart';

class PdvRepositoryImpl extends PdvRepository {
  
  final Dio _dio;
  

  PdvRepositoryImpl({required Dio dio, required AuthStore authStore}):_dio = dio;


  @override
  Future<List<PdvModel>> fetchAll() async {
    final response =  await _dio.get('/helper/get_pdvs');

    final List<PdvModel> pdvs = [];

    for (var item in response.data) {
      pdvs.add(PdvModel.fromMap(item));
    }
    return pdvs;
  }
  
}