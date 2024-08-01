import 'package:chess_pdv/app/model/product_model.dart';

abstract class ProductRepository {

  Future<List<ProductModel>> fetchAll();
}