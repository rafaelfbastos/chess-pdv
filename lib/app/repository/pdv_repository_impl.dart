
import 'package:chess_pdv/app/core/excepition/fetch_exception.dart';
import 'package:chess_pdv/app/model/pdv_model.dart';
import 'package:chess_pdv/app/repository/pdv_repository.dart';
import 'package:dio/dio.dart';

class PdvRepositoryImpl extends PdvRepository {
  
  final Dio _dio;
  

  PdvRepositoryImpl({required Dio dio}):_dio = dio;


  @override
  Future<List<PdvModel>> fetchAll() async {

    final response =  await _dio.get('/helper/get_pdvs');
    
    if(response.statusCode == 500){
      throw FetchException(message: 'Error no servidor');
    }else if(response.statusCode == 401){
      throw FetchException(message: 'Token inválido');
    }
    
    final List<PdvModel> pdvs = [];

    for (var item in response.data) {
      pdvs.add(PdvModel.fromMap(item));
    }
    return pdvs;
  }
  
}