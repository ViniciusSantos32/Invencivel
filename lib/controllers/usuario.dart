import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:invencivelemtfodasimfdsovinicius/models/Usuario.dart';

Future<Usuario> buscarUsuarios() async {
  final resposta = await http.get(
    Uri.parse(
      "http://localhost:8080/Invencivel/API_invecivel/controllers/usuario.php?rota=usuarios",
    ),
  );

  if (resposta.statusCode == 200) {
    final dados = jsonDecode(resposta.body);
    return dados;
  } else {
    final error = jsonDecode(resposta.body);
    return error;
  }
}
