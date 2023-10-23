import 'dart:convert';

import 'package:rmcheckin/app/const/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<bool> login(String email, String password) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = Uri.parse(ConstsApi.promotorAuth);
  var resposta = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
      'authorization': ConstsApi.basicAuth,
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (resposta.statusCode == 200) {
    await sharedPreferences.setString('data', utf8.decode(resposta.bodyBytes));
    return true;
  } else {
    return false;
  }
}
