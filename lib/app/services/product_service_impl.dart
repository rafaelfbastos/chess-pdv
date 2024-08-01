
import 'package:chess_pdv/app/model/product_model.dart';
import 'package:chess_pdv/app/repository/product_repository.dart';
import 'package:chess_pdv/app/services/product_service.dart';

class ProductServiceImpl implements ProductService {
  final ProductRepository _productRepository;

  ProductServiceImpl({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  Future<List<ProductModel>> fetchAll()=> _productRepository.fetchAll();
  
  
}