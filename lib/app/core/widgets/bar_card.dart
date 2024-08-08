import 'package:flutter/material.dart';

class BarCard extends StatelessWidget {
  final String name;
  final Function()? onTap;

  const BarCard({super.key, required this.name, this.onTap, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Image.asset(
              'assets/img/icon_store_circulo.png',
              width: 60,
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800]),
            ),
          ],
        ),
      )),
    );
  }
}
