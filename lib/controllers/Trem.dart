import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:invencivelemtfodasimfdsovinicius/models/Usuario.dart';

Future<Map<String, dynamic>> login(String Email, String Senha) async {
  final resposta = await http.post(
    Uri.parse(
      "http://54.94.119.191:5000/api/usuario/Login",
    ),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
    "UsuarioEmail": Email,
    "UsuarioSenha": Senha
      })
  );

  if (resposta.statusCode == 200) {
    final dados = resposta.body;
    return jsonDecode(dados);
  } else {
    throw Exception('Falha ao carregar o usuário');
  }
}

Future<Map<String, dynamic>> cadastro(String Email, String Senha, String Nome) async {
  final resposta = await http.post(
    Uri.parse(
      "http://54.94.119.191:5000/api/usuario/CadastroUsuario",
    ),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
    "UsuarioNome": Nome,
    "UsuarioEmail": Email,
    "UsuarioSenha": Senha
      })
  );

  if (resposta.statusCode == 200) {
    final dados = resposta.body;
    return jsonDecode(dados);
  } else {
    throw Exception('Falha ao carregar o usuário');
  }
}



