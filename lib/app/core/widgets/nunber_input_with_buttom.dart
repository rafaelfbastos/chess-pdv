import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class NunberInputWithButtom extends StatelessWidget {
  final String label;
  final bool active;
  final TextEditingController controller;
  final VoidCallback onTap;
  final IconData icon;

  const NunberInputWithButtom(
      {super.key,
      required this.label,
      required this.active,
      required this.controller,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 12, color: context.grey, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
                flex: 5,
                child: TextField(
                  enabled: active,
                  controller: controller,
                  style: TextStyle(color: context.grey, fontSize: 12),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: active ? Colors.white : Colors.grey.shade100,
                    filled: true,
                    isDense: true,
                    border: const OutlineInputBorder(),
                  ),
                )),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.secondaryColor, width: 1),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Icon(
                      icon,
                      size: 15,
                      color: context.secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
