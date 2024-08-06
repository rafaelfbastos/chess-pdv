import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class EmptyFrame extends StatelessWidget {

  const EmptyFrame({ super.key });

   @override
   Widget build(BuildContext context) {
       return Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/img/icon_store.png'),
                  scale: 2,
                  opacity: 0.3),
              border: Border(
                right: BorderSide(
                  color: context.backgroudColor,
                  width: 3,
                ),
              ),
            ),
          );
  }
}