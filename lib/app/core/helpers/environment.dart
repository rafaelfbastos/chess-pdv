import 'dart:math';

import 'package:chess_pdv/app/core/helpers/platforms_enum.dart';
import 'package:flutter/foundation.dart';

class Environment {
  // ignore: non_constant_identifier_names
  static String get baseUrl => (kDebugMode)?'http://localhost:8000/api':'http://rfbserver.ddns.net:8088/api';
  static PlatformsEnum platform = PlatformsEnum.unknown;

  static String get backgroudUrl {
    final urls = <String>[
      'assets/img/background-1.jpeg',
      'assets/img/background-2.jpeg',
      'assets/img/background-3.jpeg',
      'assets/img/background-4.jpeg',
      'assets/img/background-5.jpeg',
    ];
    Random random = Random();
    int randomIndex = random.nextInt(urls.length);
    return urls[randomIndex];
  }
  static String get logoUrl {
    return 'assets/img/logo-pdv.png';
  }
}
