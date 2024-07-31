import 'package:chess_pdv/app/modules/auth/login/login_page.dart';
import 'package:chess_pdv/app/modules/auth/login/login_store.dart';
import 'package:chess_pdv/app/repository/auth_repository.dart';
import 'package:chess_pdv/app/repository/auth_repository_impl.dart';
import 'package:chess_pdv/app/services/auth_service.dart';
import 'package:chess_pdv/app/services/auth_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {

   @override
   List<Bind> get binds => [
    Bind<AuthRepository>((i) => AuthRepositoryImpl(dio: i(), authStore: i())),
    Bind<AuthService>((i) => AuthServiceImpl(authRepository: i()),),
    Bind<LoginStore>((i) => LoginStore(authService: i()),)    

   ];

   @override
   List<ModularRoute> get routes => [
      ChildRoute('/login', child: (context, args) =>  LoginPage(LoginStore: context.read(),) )
   ];

}