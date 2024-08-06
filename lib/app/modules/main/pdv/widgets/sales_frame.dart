import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:chess_pdv/app/core/helpers/debouncer.dart';
import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/core/widgets/custom_text_area.dart';
import 'package:chess_pdv/app/core/widgets/increment_decrement_input.dart';
import 'package:chess_pdv/app/core/widgets/number_input.dart';
import 'package:chess_pdv/app/core/widgets/nunber_input_with_buttom.dart';
import 'package:chess_pdv/app/model/product_model.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:chess_pdv/app/modules/main/pdv/widgets/img_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class SalesFrame extends StatefulWidget {
  final PdvPageController controller;

  const SalesFrame({super.key, required this.controller});

  @override
  State<SalesFrame> createState() => _SalesFrameState();
}

class _SalesFrameState extends State<SalesFrame> {
  final numberFormat = NumberFormat('###.00', 'pt_BR');
  final quantidadeEC = TextEditingController(text: '1,00');
  final precoEC = TextEditingController();
  final precoTotalEC = TextEditingController();
  final descontoEC = TextEditingController();
  final controlerDropDown = SingleSelectController<ProductModel>(null);
  final descriptionEC = TextEditingController();
  final WidgetStatesController statesController = WidgetStatesController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    precoEC.dispose();
    precoTotalEC.dispose();
    descontoEC.dispose();
    quantidadeEC.dispose();
    descriptionEC.dispose();
    controlerDropDown.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Debouncer debouncer = Debouncer(milliseconds: 500);

    _calcTotal() {
      final preco = numberFormat.parse(precoEC.text);
      final qtd = numberFormat.parse(quantidadeEC.text);
      final desconto = numberFormat.parse(descontoEC.text);
      final total = (preco * qtd) - desconto;
      precoTotalEC.text = numberFormat.format(total);
    }

    return Observer(
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomDropdown.search(
                    overlayHeight: size.height * 0.5,
                    noResultFoundText: 'Nenhum produto encontrado',
                    decoration: CustomDropdownDecoration(
                      closedBorder: Border.all(color: context.secondaryColor),
                      expandedBorder: Border.all(color: context.secondaryColor),
                    ),
                    controller: controlerDropDown,
                    hintText: 'Selecione o produto',
                    searchHintText: 'Pesquisar produto',
                    items: widget.controller.products,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          quantidadeEC.text = '1,00';
                          descontoEC.text = '0,00';
                          precoEC.text = numberFormat.format(value.salePrice);
                          _calcTotal();
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: ImgProduct(),
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 240,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controlerDropDown.value?.description ?? '',
                              style: TextStyle(
                                  color: context.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              controlerDropDown.value != null
                                  ? numberFormat.format(
                                      controlerDropDown.value?.salePrice)
                                  : '',
                              style: TextStyle(
                                  color: context.grey,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 8,
                        child: IncrementDecrementInput(
                          onDecrement: () {
                            final qtd = numberFormat.parse(quantidadeEC.text);
                            if (qtd > 1) {
                              quantidadeEC.text = numberFormat.format(qtd - 1);
                              _calcTotal();
                            }
                          },
                          onIncrement: () {
                            final qtd = numberFormat.parse(quantidadeEC.text);
                            quantidadeEC.text = numberFormat.format(qtd + 1);
                            _calcTotal();
                          },
                          onChanged: (value) => debouncer(
                            () {
                              if (value.isNotEmpty) {
                                _calcTotal();
                              } else {
                                quantidadeEC.text = '1,00';
                                _calcTotal();
                              }
                            },
                          ),
                          label: 'Quantidade:',
                          controller: quantidadeEC,
                        ),
                      ),
                      const Flexible(flex: 1, child: SizedBox()),
                      Flexible(
                          flex: 8,
                          child: NunberInputWithButtom(
                            active: false,
                            label: 'Desconto',
                            controller: descontoEC,
                            onTap: () {},
                            icon: Icons.percent,
                          )),
                      const Flexible(flex: 1, child: SizedBox()),
                      Flexible(
                        flex: 8,
                        child: NumberInput(
                          controller: precoEC,
                          label: 'Valor unitário:',
                        ),
                      ),
                      const Flexible(flex: 1, child: SizedBox()),
                      Flexible(
                        flex: 8,
                        child: NumberInput(
                          controller: precoTotalEC,
                          label: 'Sub Total:',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 8,
                            child: CustomTextArea(
                                label: 'Descrição:',
                                controller: descriptionEC)),
                        const Flexible(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                            flex: 4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: widget.controller.selectedRoom != null
                                    ? BorderSide(color: context.secondaryColor)
                                    : null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: widget.controller.selectedRoom != null
                                  ? () {}
                                  : null,
                              child: const Text('Inserir',
                                  style: TextStyle(fontSize: 16)),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
