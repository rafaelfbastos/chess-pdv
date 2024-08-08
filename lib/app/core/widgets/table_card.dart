import 'package:flutter/material.dart';

class TableCard extends StatelessWidget {
  final String tableNumber;
  final Function()? onTap;
  const TableCard({super.key, required this.tableNumber, this.onTap});

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
      )),
    );
  }
}
