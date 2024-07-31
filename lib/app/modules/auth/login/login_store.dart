
import 'package:chess_pdv/app/services/auth_service.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final AuthService _authService;

  LoginStoreBase({
    required AuthService authService,
  }) : _authService = authService;

  @observable
  bool loading = false;
  
  @observable
  String error = '';

  @observable
  bool isLogged = false;

  @action
  Future<void> login(String email, String password) async {
    try {
      loading = true;
      await _authService.login(email, password);
      isLogged = true;
    } catch (e) {
      error = 'Erro ao realizar login';
    } finally {
      loading = false;
    }
  }

  @action
  void setError(String value) => error = value;

}