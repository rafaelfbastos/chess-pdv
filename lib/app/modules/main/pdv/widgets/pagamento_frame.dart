import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:flutter/material.dart';

class PagamentoFrame extends StatelessWidget {
  
  final PdvPageController controller;

  const PagamentoFrame({ super.key, required this.controller });

   @override
   Widget build(BuildContext context) {
       return Container(
        color: Colors.green,
       );
  }
}