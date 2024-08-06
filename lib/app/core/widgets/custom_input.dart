import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconButton? suffixIconButton;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  CustomInput(
      {super.key,
      required this.label,
      required this.obscureText,
      this.suffixIconButton,
      this.controller,
      this.validator,
      this.focusNode, this.onFieldSubmitted})
      : assert(obscureText == true ? suffixIconButton == null : true),
        obscureTextVN = ValueNotifier(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          controller: controller,
          focusNode: focusNode,
          style:  TextStyle(color: context.secondaryColor),
          decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
              floatingLabelStyle:TextStyle(color: context.primaryColor),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:  BorderSide(color: context.primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              suffixIcon: suffixIconButton ??
                  (obscureText == true
                      ? IconButton(
                          onPressed: () {
                            obscureTextVN.value = !obscureTextValue;
                          },
                          icon: Icon(obscureTextValue
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,color: Colors.grey,),
                        )
                      : null)),
          obscureText: obscureTextValue,
        );
      },
    );
  }
}
