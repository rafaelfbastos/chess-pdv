import 'package:flutter/material.dart';

class TableCard extends StatelessWidget {
  final String tableNumber;
  const TableCard({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(
            'assets/img/icon_table_circular.png',
            width: 60,
          ),
          Text(
            'Mesa $tableNumber',
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
