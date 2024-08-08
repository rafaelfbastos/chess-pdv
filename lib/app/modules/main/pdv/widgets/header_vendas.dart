import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:chess_pdv/app/modules/main/pdv/widgets/modal_new_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HeaderVendas extends StatelessWidget {
  final PdvPageController controller;

  const HeaderVendas({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (contex) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.titleVenda,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  child: Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(80, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () => showDialog(
                          context: contex,
                          builder: (context) => ModalNewOrder(controller: controller,),
                        ),
                        child: const Text(
                          'Nova venda',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }
}
