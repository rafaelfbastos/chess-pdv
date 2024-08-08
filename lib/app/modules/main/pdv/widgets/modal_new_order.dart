import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/model/order_splip_model.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:flutter/material.dart';

class ModalNewOrder extends StatefulWidget {
  final PdvPageController _controller;
  const ModalNewOrder({super.key, required PdvPageController controller})
      : _controller = controller;

  @override
  State<ModalNewOrder> createState() => _ModalNewOrderState();
}

class _ModalNewOrderState extends State<ModalNewOrder> {
  final descriptionEC = TextEditingController();
  var isTable = false;
  var iscounter = false;
  String? errorText;

  @override
  void dispose() {
    descriptionEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Nova Comanda',
        textAlign: TextAlign.center,
        style: TextStyle(color: context.secondaryColor),
      ),
      content: SizedBox(
        width: 450,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  hoverColor: context.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => setState(() {
                    isTable = true;
                    iscounter = false;
                  }),
                  child: Card(
                    shadowColor: context.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/img/order_icon.png',
                            width: 60,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Mesa',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  hoverColor: context.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => setState(() {
                    isTable = false;
                    iscounter = true;
                  }),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/img/icon_store.png',
                            width: 60,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Balcão',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: isTable || iscounter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  isTable
                      ? 'Nova comanda para a mesa:'
                      : 'Nova comanda para o balcão:',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Visibility(
              visible: isTable || iscounter,
              child: TextField(
                controller: descriptionEC,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  errorText: errorText,
                  labelText: isTable ? 'Número da mesa' : 'Nome do cliente',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.primaryColor,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            if (descriptionEC.text.isEmpty) {
              setState(() {
                errorText = 'Campo obrigatório';
              });
            } else {
              final order = OrderSplipModel(
                type: isTable ? 'Mesa' : 'Balcão',
                tableNumber: descriptionEC.text,
                guests: [],
                products: [],
              );
              widget._controller.createOrderSplip(order);
              Navigator.of(context).pop();
            }

            //Navigator.of(context).pop();
          },
          child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Criar',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.alertColor,
            foregroundColor: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Cancelar',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }
}
