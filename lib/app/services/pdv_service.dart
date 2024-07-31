import 'package:chess_pdv/app/model/pdv_model.dart';

abstract class PdvService {

  Future<List<PdvModel>> fetchAll();


}