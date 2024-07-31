import 'package:chess_pdv/app/core/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PdvPage extends StatelessWidget {

  const PdvPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('PDV'),),
           body: ElevatedButton(child: const Text('logout'), onPressed: () {
             AuthStore authStore = Modular.get();
              authStore.logout();
           },),
       );
  }
}