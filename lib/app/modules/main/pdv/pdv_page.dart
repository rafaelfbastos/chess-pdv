import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/core/widgets/content.dart';
import 'package:chess_pdv/app/model/product_model.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:chess_pdv/app/modules/main/widgets/pdv_app_bar.dart';
import 'package:chess_pdv/app/modules/main/widgets/pdv_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PdvPage extends StatefulWidget {
  final PdvPageController _controller;

  const PdvPage({super.key, required PdvPageController controller})
      : _controller = controller;

  @override
  State<PdvPage> createState() => _PdvPageState();
}

class _PdvPageState extends State<PdvPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await widget._controller.loadProducts();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroudColor,
      drawer: const PdvDrawer(),
      appBar: PdvAppBar(
        title: 'Ponto de Venda  - ${widget._controller.pdv.description}',
      ),
      body: Observer(
        builder: (context) {
          return  SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                   Expanded(
                      flex: widget._controller.flex1,
                      child: const Content(
                        header: Text('Titulo'),
                      )),
                   const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: widget._controller.flex2,
                    child: Content(
                      header: IconButton(onPressed: ()=> widget._controller.toogleExpanded(), icon:  Icon(
                        !widget._controller.expanded? Icons.arrow_back_ios_new: Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
