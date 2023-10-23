import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rmcheckin/app/const/const.dart';

class VerificarEmailService {
  Future<bool> verificarEmail({
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse(ConstsApi.validarEmail),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': ConstsApi.basicAuth,
      },
      body: jsonEncode(
        <String, String>{
          'email': email,
        },
      ),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['data'] == 'ok') {
        print('Email verificado com sucesso');
        return true;
      } else {
        print('Erro: ${responseData['errors'][0]}');
        return false;
      }
    } else {
      print('Erro na chamada da API: ${response.statusCode}');
      return false;
    }
  }
}
