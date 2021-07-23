import 'package:http/http.dart' as http;
import 'package:rest_api_app/Models/demomodel.dart';
import 'dart:convert';
import 'constants.dart';

Future<List<DemoModel>> fetchData() async {
  final response = await http.get(Uri.parse("${(apiUrl)}/users"));
  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((p) => DemoModel.fromJson(p))
        .toList();
  } else {
    throw Exception('Failed to load DemoAPI');
  }
}
