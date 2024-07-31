
import 'package:chess_pdv/app/model/pdv_model.dart';
import 'package:chess_pdv/app/repository/pdv_repository.dart';
import 'package:chess_pdv/app/services/pdv_service.dart';

class PdvServiceImpl implements PdvService{

  final PdvRepository _pdvRepository;

  PdvServiceImpl({
    required PdvRepository pdvRepository,
  }) : _pdvRepository = pdvRepository;

  @override
  Future<List<PdvModel>> fetchAll() => _pdvRepository.fetchAll();
  
  
}