import 'package:chess_pdv/app/model/pdv_model.dart';

abstract class PdvRepository {
  Future<List<PdvModel>> fetchAll();

}