import 'package:chess_pdv/app/core/excepition/fetch_exception.dart';
import 'package:chess_pdv/app/model/product_model.dart';
import 'package:chess_pdv/app/repository/product_repository.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio _dio;

  ProductRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<ProductModel>> fetchAll() async {
    try {
      final response = await _dio.post('/helper/get_products');

      if (response.statusCode != 200) {
        throw FetchException(message: 'Error no servidor');
      }
      List<ProductModel> products = [];

      for (var item in response.data) {
        products.add(ProductModel.fromMap(item));
      }

      return products;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
