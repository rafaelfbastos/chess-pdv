import 'package:chess_pdv/app/core/store/auth_store.dart';
import 'package:chess_pdv/app/model/user_model.dart';
import 'package:chess_pdv/app/modules/main/pdv_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PdvDrawer extends StatelessWidget {
  const PdvDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = context.read<AuthStore>();
    final PdvStore pdvStore = context.read<PdvStore>();
    final use = authStore.user ?? UserModel.blanck();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      stops: [0.1, 1],
                      colors: [Color(0xffB586EA), Color(0xff25A4E9)])),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Text(
                      use.name[0],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      use.name,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    use.role.name,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ],
              )),
          ListTile(
            title: const Text('Mudar de PDV'),
            leading: const Icon(Icons.store),
            onTap: () {
              pdvStore.clearSelectedPdv();
              Modular.to.navigate('/select-pdv');
            },
          ),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () {
              authStore.logout();
            },
          ),
        ],
      ),
    );
  }
}
