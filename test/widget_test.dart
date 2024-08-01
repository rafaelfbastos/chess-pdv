// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:chess_pdv/app/core/excepition/fetch_exception.dart';
import 'package:chess_pdv/app/repository/pdv_repository.dart';
import 'package:chess_pdv/app/repository/pdv_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Fecth não autorizado', (WidgetTester tester) async {
    
    Dio dio = Dio();
    dio.options.baseUrl = 'http://localhost:8000/api';

    final PdvRepository pdvRepository = PdvRepositoryImpl(dio: dio);

    expect(() async => await pdvRepository.fetchAll(), throwsA(isA<FetchException>));
    
  });
}
