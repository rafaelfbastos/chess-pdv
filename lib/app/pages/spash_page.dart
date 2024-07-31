import 'package:chess_pdv/app/core/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SpashPage extends StatefulWidget {
  final AuthStore _authStore;

  const SpashPage({super.key, required AuthStore authStore})
      : _authStore = authStore;

  @override
  State<SpashPage> createState() => _SpashPageState();
}

class _SpashPageState extends State<SpashPage> {
  @override
  void initState() {
    reaction((_) => widget._authStore.authorization, (authorization) {
      if (authorization != null) {
        Modular.to.pushReplacementNamed('/select-pdv');
      } else {
        Modular.to.pushReplacementNamed('/auth/login');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {

      if (widget._authStore.authorization != null) {
        Modular.to.pushReplacementNamed('/select-pdv');
      } else {
        Modular.to.pushReplacementNamed('/auth/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
