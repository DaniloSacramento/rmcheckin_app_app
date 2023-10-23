import 'dart:convert';
import 'package:rmcheckin/app/const/const.dart';
import 'package:http/http.dart' as http;
import 'package:rmcheckin/app/models/escala_promotor_ponto.dart';

Future<List<PromotorEscalaPonto>> pontoPromotor({
  required email,
  required String data1Filter,
  required String data2Filter,
  required String lojaFilter,
  required String faltasFilter,
}) async {
  final response = await http.post(
    Uri.parse(ConstsApi.ponto),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'authorization': ConstsApi.basicAuth,
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'data1Filter': data1Filter,
      'data2Filter': data2Filter,
      'lojaFilter': lojaFilter,
      'faltasFilter': faltasFilter,
    }),
  );
  print(response.body);
  if (response.statusCode == 200) {
    List<dynamic> responseData = json.decode(response.body)['data'];
    return responseData.map((json) => PromotorEscalaPonto.fromMap(json)).toList();
  } else {
    throw Exception('Falha ao carregar os pontos');
  }
}
