import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  const CustomTextArea(
      {super.key,
      required this.label,
      this.active = true,
      required this.controller});

  final String label;
  final bool active;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 12, color: context.grey, fontWeight: FontWeight.bold),
          ),
          TextField(
            enabled: active,
            maxLines: 3,
            controller: controller,
            style: context.inputStyle,
            decoration: InputDecoration(
              fillColor: active ? Colors.white : Colors.grey.shade100,
              filled: true,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
