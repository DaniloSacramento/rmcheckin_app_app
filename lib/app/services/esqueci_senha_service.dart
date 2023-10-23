import 'dart:convert';
import 'package:rmcheckin/app/const/const.dart';
import 'package:http/http.dart' as http;

class EsqueciSenhaDataSorce {
  Future<bool> esqueciSenhaService({required String email}) async {
    var url = Uri.parse(ConstsApi.esqueciSenha);
    var response = await http.post(
      url,
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
      print(response.body);
      final responseData = json.decode(response.body);

      if (responseData['data'] == 'ok') {
        print('Sucesso');
        return true;
      } else {
        final errors = responseData['errors'];
        print('Erro: $errors');
        return false;
      }
    }
    return false;
  }
}
