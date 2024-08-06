import 'package:chess_pdv/app/core/ui/messages.dart';
import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/core/widgets/content.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:chess_pdv/app/modules/main/pdv/widgets/delete_products_modal.dart';
import 'package:chess_pdv/app/modules/main/pdv/widgets/frame_grid_rooms.dart';
import 'package:chess_pdv/app/modules/main/pdv/widgets/frame_product_list.dart';
import 'package:chess_pdv/app/modules/main/pdv/widgets/guest_frame.dart';
import 'package:chess_pdv/app/modules/main/pdv/widgets/header_vendas.dart';
import 'package:chess_pdv/app/modules/main/pdv/widgets/pagamento_frame.dart';
import 'package:chess_pdv/app/modules/main/pdv/widgets/sales_frame.dart';
import 'package:chess_pdv/app/modules/main/widgets/pdv_app_bar.dart';
import 'package:chess_pdv/app/modules/main/widgets/pdv_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mobx/mobx.dart';

class PdvPage extends StatefulWidget {
  final PdvPageController _controller;

  const PdvPage({super.key, required PdvPageController controller})
      : _controller = controller;

  @override
  State<PdvPage> createState() => _PdvPageState();
}

class _PdvPageState extends State<PdvPage> with SingleTickerProviderStateMixin {
  final toDispose = <ReactionDisposer>[];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    final loadReaction =
        reaction((__) => widget._controller.isLoading, (loading) {
      if (loading) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });

    final errorMessage = reaction((__) => widget._controller.error, (error) {
      if (error.isNotEmpty) {
        Messages.of(context).showError(error);
        widget._controller.setError('');
      }
    });

    final pdvChangeReaction = reaction((__) => widget._controller.pdv, (pdv) {
      widget._controller.clear();
    });

    final dialogDeleteItem =
        reaction((__) => widget._controller.showDeleteItemModal, (show) {
      if (show) {
        showDialog(
            context: context,
            builder: (contex) => DeleteProductsModal(
                  controller: widget._controller,
                )).then((value) {
          widget._controller.showDeleteItemModal = false;
        });
      }
    });

    toDispose.addAll(
        [loadReaction, errorMessage, pdvChangeReaction, dialogDeleteItem]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("#,##0.00", "pt_BR");

    return Scaffold(
      backgroundColor: context.backgroudColor,
      drawer: const PdvDrawer(),
      appBar: PdvAppBar(
        title: 'Ponto de Venda  - ${widget._controller.pdv.description}',
      ),
      body: Observer(
        builder: (context) {
          return SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 11,
                    child: Content(
                      header: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: HeaderVendas(
                            controller: widget._controller,
                          )),
                      //BODY///
                      body: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: context.backgroudColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: TabBar(
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        controller: _tabController,
                                        tabs: const [
                                          Tab(
                                            icon: Icon(Icons.shopping_cart),
                                            text: 'Produtos',
                                          ),
                                          Tab(
                                            icon: Icon(Icons.person),
                                            text: 'Hóspede',
                                          ),
                                          Tab(
                                            icon: Icon(Icons.payment),
                                            text: 'Pagamento',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 14,
                                      child: TabBarView(
                                        controller: _tabController,
                                        children: [
                                          SalesFrame(
                                              controller: widget._controller),
                                          GuestFrame(
                                              controller: widget._controller),
                                          PagamentoFrame(
                                              controller: widget._controller),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: context.backgroudColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: widget._controller.showRoomGrid
                                  ? FrameGridRooms(
                                      controller: widget._controller)
                                  : FrameProductList(
                                      controller: widget._controller),
                            ),
                          ),
                        ],
                      ),
                      footer: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            !widget._controller.showRoomGrid
                                ? RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                          text: 'Total ',
                                          style: TextStyle(fontSize: 18)),
                                      TextSpan(
                                          text: numberFormat.format(
                                              widget._controller.totalValue),
                                          style: const TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold)),
                                    ]),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Expanded(
                    flex: 1,
                    child: Content(
                      header: Text(
                        'MESAS',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      body: Text('Body'),
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
