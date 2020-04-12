import 'package:flutterdust/dart/air_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

class AirBloc {
  final _airSubject = BehaviorSubject<AirResult>();

  AirBloc() {
    fetch();
  }

  Future<AirResult> fetchData() async {
    var response = await http.get(
        'https://api.airvisual.com/v2/nearest_city?key=db4ff40e-d60b-45a5-98b7-878e078ba28a');
    AirResult result = AirResult.fromJson(json.decode(response.body));
    return result;
  }

  void fetch() async {
    print('fetch');
    var airResult = await fetchData();
    _airSubject.add(airResult);
  }

  Stream<AirResult> get airResult => _airSubject.stream;
}
