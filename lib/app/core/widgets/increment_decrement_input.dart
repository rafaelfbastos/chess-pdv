import 'package:brasil_fields/brasil_fields.dart';
import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IncrementDecrementInput extends StatelessWidget {
  final String label;
  final bool? active;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onIncrement;
  final Function()? onDecrement;

  const IncrementDecrementInput({
    super.key,
    required this.label,
    this.active,
    required this.controller,
    this.onChanged,
    this.onIncrement,
    this.onDecrement,
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
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: onDecrement,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.secondaryColor, width: 1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Icon(
                        FontAwesomeIcons.minus,
                        size: 15,
                        color: context.secondaryColor,
                      )),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: TextField(
                enabled: active,
                onChanged: onChanged,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter()
                ],
                controller: controller,
                style: TextStyle(color: context.grey, fontSize: 12),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: onIncrement,
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
                      FontAwesomeIcons.plus,
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
