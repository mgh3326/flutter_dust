// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdust/dart/air_result.dart';
import 'package:http/http.dart' as http;

void main() {
  test('http 통신 테스트', () async {
    var response = await http.get(
        'https://api.airvisual.com/v2/nearest_city?key=db4ff40e-d60b-45a5-98b7-878e078ba28a');
    expect(response.statusCode, 200);
    AirResult result = AirResult.fromJson(json.decode(response.body));
    expect(result.status, 'success');
  });
}
