// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chess_pdv/app/core/excepition/auth_exception.dart';
import 'package:chess_pdv/app/core/store/auth_store.dart';
import 'package:chess_pdv/app/model/authorization_model.dart';
import 'package:chess_pdv/app/model/user_model.dart';
import 'package:chess_pdv/app/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  
  final Dio _dio;
  final AuthStore _authStore;

  AuthRepositoryImpl({
    required Dio dio,
    required AuthStore authStore
  }):_dio = dio, _authStore = authStore;
  
  @override
  Future<void> login(String email, String password) async {
    final response = await _dio.post('/login', data: {
      'email': email,
      'password': password
    });
    if (response.statusCode == 200) {
      final data = response.data;
      if (data['user'] != null) {
          final user = UserModel.fromMap(data['user']);
          final authorization = AuthorizationModel.fromMap(data['authorization']);
          _authStore.setAuthorization(authorization);
          _authStore.setUser(user);
      } else {
        throw AuthException(message: 'Erro ao fazer login');
      }
      
    }else{
      throw  AuthException(message: 'Erro ao fazer login');
    }
  }
  

  
}
