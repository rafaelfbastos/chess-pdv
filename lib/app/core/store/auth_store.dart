import 'package:chess_pdv/app/model/authorization_model.dart';
import 'package:chess_pdv/app/model/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {

  late Box<AuthorizationModel> _authorizationBox;
  late Box<UserModel> _userBox;

  AuthStoreBase() {
    _authorizationBox = Hive.box<AuthorizationModel>('authorization');
    _userBox = Hive.box<UserModel>('user');
    
  }

  @observable
  AuthorizationModel? authorization;
  
  @observable
  UserModel? user;

  @computed
  bool get isLogged => authorization != null;

  @action
  loadBoxes(){
    authorization = _authorizationBox.values.firstOrNull;
    user = _userBox.values.firstOrNull;
  }

  @action
  setAuthorization(AuthorizationModel value){
    _authorizationBox.put('authorization', value);
    authorization = value;
  }
  
  @action
  setUser(UserModel value){
    _userBox.put('user', value);
    user = value;
  }

  @action
  logout(){
    _authorizationBox.clear();
    _userBox.clear();
    authorization = null;
    user = null;
  }


/*
  loadListerner(){
    reaction((_) => authorization, (authorization) {
      if (authorization != null) {
        Modular.to.pushReplacementNamed('/');
      } else {
        Modular.to.pushReplacementNamed('/auth/login');
      }
    });
  }
*/
}