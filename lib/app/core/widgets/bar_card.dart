import 'package:flutter/material.dart';

class BarCard extends StatelessWidget {
  final String name;

  const BarCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    ));
  }
}
