import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:invencivelemtfodasimfdsovinicius/models/Trem.dart';

Future<List<String>> buscarTrens() async {
  final resposta = await http.get(
    Uri.parse(
      "http://54.94.119.191:5000/api/trem/ObterNomeTrem",
    ),
  );

  if (resposta.statusCode == 200) {
    final dados = resposta.body; 
  return (jsonDecode(dados) as List).cast<String>();
  } else {
    throw Exception('Falha ao pegar nomes de trem');
  }
}

Future<Trem>  ObterDadosTremPorNome(String TremSelecionado) async {
  final resposta = await http.get(
    Uri.parse(
      "http://54.94.119.191:5000/api/trem/ObterDadosPorNome?nomeTrem=$TremSelecionado"));

      if(resposta.statusCode == 200){
      final dados = resposta.body;
  return Trem.fromJson(jsonDecode(dados));
      }else{
        throw Exception('Falha ao carregar os dados do trem');
      }
      }



