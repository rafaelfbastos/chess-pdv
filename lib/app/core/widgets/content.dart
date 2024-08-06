import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  const Content({super.key, this.header, this.body, this.footer});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                color: context.primaryColor),
            child: Center(
              child: header,
            ),
          ),
          Expanded(
            flex: 11,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: context.backgroudColor,
                    width: 2,
                  ),
                ),
              ),
              child: body,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: context.backgroudColor,
                    width: 2,
                  ),
                ),
              ),
              child: footer,
            ),
          ),
        ],
      ),
    );
  }
}
