import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/modules/main/pdv_store.dart';
import 'package:chess_pdv/app/modules/main/select_pdv/widgets/card_select_pdv.dart';
import 'package:chess_pdv/app/modules/main/widgets/pdv_app_bar.dart';
import 'package:chess_pdv/app/modules/main/widgets/pdv_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectPdvPage extends StatefulWidget {
  final PdvStore _pdvStore;

  const SelectPdvPage({super.key, required PdvStore pdvStore})
      : _pdvStore = pdvStore;

  @override
  State<SelectPdvPage> createState() => _SelectPdvPageState();
}

class _SelectPdvPageState extends State<SelectPdvPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget._pdvStore.selectedPdv !=null) {
        Modular.to.pushReplacementNamed('/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PdvDrawer(),
      backgroundColor: context.backgroudColor,
      appBar: const PdvAppBar(
        title: '',
      ),
      body: Observer(
        builder: (context) => Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SELECIONE O PONTO DE VENDA',
                  style: TextStyle(
                      color: context.secondaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: 20,
                  children: widget._pdvStore.pdvList
                      .map((pdv) => CardSelectPdv(
                            pdv: pdv,
                            ontap: () {
                              widget._pdvStore.selectPdv(pdv);
                              Modular.to.pushReplacementNamed('/');
                            },
                          ))
                      .toList(),
                ),
              ],
            )),
      ),
    );
  }
}
