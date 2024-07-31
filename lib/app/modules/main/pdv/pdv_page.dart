import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:chess_pdv/app/modules/main/widgets/pdv_app_bar.dart';
import 'package:chess_pdv/app/modules/main/widgets/pdv_drawer.dart';
import 'package:flutter/material.dart';

class PdvPage extends StatefulWidget {
  final PdvPageController _controller;

  const PdvPage({super.key, required PdvPageController controller})
      : _controller = controller;

  @override
  State<PdvPage> createState() => _PdvPageState();
}

class _PdvPageState extends State<PdvPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroudColor,
      drawer: const PdvDrawer(),
      appBar:  PdvAppBar(
        title: 'Ponto de Venda  - ${widget._controller.pdv.description}',
      ),
      body: Container()
    );
  }
}
