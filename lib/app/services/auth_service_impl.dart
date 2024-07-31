
import 'package:chess_pdv/app/repository/auth_repository.dart';
import 'package:chess_pdv/app/services/auth_service.dart';

class AuthServiceImpl extends AuthService {
  final AuthRepository _authRepository;

  AuthServiceImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  
  @override
  Future<void> login(String email, String password) => _authRepository.login(email, password);
  
}