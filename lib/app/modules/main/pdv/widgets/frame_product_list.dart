import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class FrameProductList extends StatelessWidget {
  final PdvPageController controller;

  const FrameProductList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat("#,##0.00", "pt_BR");

    TextStyle getStyle(int? id) {
     return controller.pdv.id == id?  TextStyle(
        color: context.secondaryColor,
        fontWeight: FontWeight.w700,
      ): TextStyle(
        color: Colors.grey[500],
      );
    }

    bool isPdvSelected(int? id) {
      return controller.pdv.id == id;
    }

    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    controller.titleProduct,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: context.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                columns: const [
                  DataColumn2(
                    label: Text('Produto'),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('Qtde. (1,00)'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text('Preço'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text('Subtotal'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: SizedBox(width: double.maxFinite,child: Text('Ações',textAlign: TextAlign.center,),),
                  ),
                ],
                rows: controller.orderproducts
                    .map<DataRow>((product) => DataRow(
                          cells: [
                            DataCell(Text(product.description, style: getStyle(product.pivot?.pdvId),)),
                            DataCell(Text(numberFormat
                                .format(product.pivot?.quantity ?? 0),style: getStyle(product.pivot?.pdvId))),
                            DataCell(
                                Text(numberFormat.format(product.salePrice),style: getStyle(product.pivot?.pdvId))),
                            DataCell(
                              Text(
                                numberFormat.format(
                                    ((product.pivot?.quantity ?? 0) *
                                        product.salePrice)),style: getStyle(product.pivot?.pdvId)
                              ),
                            ),
                            DataCell(Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  tooltip: 'Editar',
                                  onPressed:  isPdvSelected(product.pivot?.pdvId) ? () {} : null,
                                  icon: const Icon(
                                    FontAwesomeIcons.penToSquare,
                                    size: 15,
                                  ),
                                ),
                                IconButton(
                                  tooltip: 'Excluir',
                                  onPressed: isPdvSelected(product.pivot?.pdvId) ? ()=> controller.openDeleteItemModal(product):null,
                                  icon: const Icon(
                                    FontAwesomeIcons.trash,
                                    size: 15,
                                  ),
                                ),
                                IconButton(
                                  tooltip: 'Imprimir',
                                  onPressed: isPdvSelected(product.pivot?.pdvId) ? () {} : null,
                                  icon: const Icon(
                                    FontAwesomeIcons.print,
                                    size: 15,
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      );
    });
  }
}
