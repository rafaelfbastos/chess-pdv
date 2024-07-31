import 'package:chess_pdv/app/model/pdv_model.dart';
import 'package:flutter/material.dart';

class CardSelectPdv extends StatelessWidget {
  final PdvModel pdv;
  final Function() ontap;
  final ValueNotifier<double> elevationVN;

  CardSelectPdv({super.key, required this.pdv, required this.ontap})
      : elevationVN = ValueNotifier(3.0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: elevationVN,
      builder: (_, elevation, child) => MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) => elevationVN.value=15,
        onExit: (event) => elevationVN.value=3,
        child: GestureDetector(
          onTap: ontap,
          child: Card(
              elevation: elevation,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 239,
                    child: Image.asset('assets/img/select-pdv.png',
                        fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      pdv.description,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
