import 'package:chess_pdv/app/model/product_model.dart';

abstract class ProductService {
  Future<List<ProductModel>> fetchAll();
}