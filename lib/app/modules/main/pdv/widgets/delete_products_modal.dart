import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DeleteProductsModal extends StatefulWidget {
  final PdvPageController controller;

  const DeleteProductsModal({super.key, required this.controller});

  @override
  State<DeleteProductsModal> createState() => _DeleteProductsModalState();
}

class _DeleteProductsModalState extends State<DeleteProductsModal> {

  final descriptionEC = TextEditingController();

  @override
  void dispose() {
    descriptionEC.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("#,##0.00", "pt_BR");
    var qtd = 1;
    final numberEC = TextEditingController(text: numberFormat.format(qtd));

    return Observer(
        builder: (context) => AlertDialog(
              titleTextStyle: TextStyle(
                  color: context.secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              title: const Text('Quantidade:', textAlign: TextAlign.center),
              content: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Quantidade: ${numberFormat.format(widget.controller.selectedProduct?.pivot?.quantity)}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Color(0xff93969b),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: TextField(
                            controller: numberEC,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Quantidade retirada',
                              labelStyle: TextStyle(
                                color: Color(0xff93969b),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              if (qtd > 1) {
                                qtd--;
                                numberEC.text = numberFormat.format(qtd);
                              }
                            },
                            icon: Icon(
                              FontAwesomeIcons.circleMinus,
                              color: context.alertColor,
                              size: 40,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              if (qtd <
                                  widget.controller.selectedProduct!.pivot!.quantity) {
                                qtd++;
                                numberEC.text = numberFormat.format(qtd);
                              }
                            },
                            icon: Icon(
                              FontAwesomeIcons.circlePlus,
                              color: context.primaryColor,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: descriptionEC,
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      decoration:  InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: TextStyle(
                          color: context.grey,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.alertColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    final description = descriptionEC.text;
                    widget.controller.delectProduct(qtd, description);
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Excluir',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.grey,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ));
  }
}
