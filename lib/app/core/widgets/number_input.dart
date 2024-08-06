// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chess_pdv/app/core/ui/theme_extension.dart';

class NumberInput extends StatelessWidget {
  final String label;
  final bool active;
  final TextEditingController controller;
  final IconButton? suffixIconButton;

  const NumberInput({
    super.key,
    required this.label,
    this.active = false,
    required this.controller,
    this.suffixIconButton,
  });

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
        TextField(
          enabled: active,
          controller: controller,
          style: TextStyle(color: context.grey, fontSize: 12),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            suffixIcon: suffixIconButton,
            fillColor: active ? Colors.white:Colors.grey.shade100,
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        )
      ],
    );
  }
}
