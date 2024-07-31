import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page404 extends StatelessWidget {

  const Page404({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
            child: SizedBox(
              width: 500,
              height: 500,
              child: Lottie.asset('assets/lotties/404.json', fit: BoxFit.fill),
            ),
           ),
       );
  }
}