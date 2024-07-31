import 'package:flutter/material.dart';
import 'package:chess_pdv/app/core/ui/theme_extension.dart';

class AppBarLeading extends StatelessWidget {

  const AppBarLeading({ super.key });

   @override
   Widget build(BuildContext context) {
       return Container(
        decoration: BoxDecoration(color: context.backgroudColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
              decoration: BoxDecoration(
                color: context.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              )),
        ),
      );
  }
}