import 'package:flutter/material.dart';

class ImgProduct extends StatelessWidget {
  const ImgProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 75),
          child:
              Image.asset('assets/img/sem_imagem.png', width: 100, height: 100),
        ),
      ),
    );
  }
}
