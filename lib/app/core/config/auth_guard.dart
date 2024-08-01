import 'dart:async';

import 'package:chess_pdv/app/core/store/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final authStore = Modular.get<AuthStore>();
    return authStore.isLogged;
  }
}
