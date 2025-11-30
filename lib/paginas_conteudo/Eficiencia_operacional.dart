import 'package:flutter/material.dart';
import 'package:invencivelemtfodasimfdsovinicius/controllers/Trem.dart';
import 'package:invencivelemtfodasimfdsovinicius/models/Trem.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaTrens(),
    ));

class TelaTrens extends StatefulWidget {
  @override
  _TelaTrensState createState() => _TelaTrensState();
}

class _TelaTrensState extends State<TelaTrens> {
  String? tremSelecionado;

  late Future<List<String>> nomesTrens;

  String aviso = '';
  String localizacao = '';
  String proximaParada = '';
  String tempo = '';

  @override
  void initState() {
    super.initState();
    nomesTrens = buscarTrens(); // ← CARREGA LISTA DE NOMES DA API
  }

  Future<void> atualizarInformacoes(String nome) async {
    final dados = await ObterDadosTremPorNome(nome);

    setState(() {
      aviso = dados.atraso_trem;
      localizacao = dados.onde_trem;
      proximaParada = dados.proxParada_trem;
      tempo = dados.demora_trem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6C7B9),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: FutureBuilder<List<String>>(
            future: nomesTrens,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());

              final lista = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Eficiência operacional',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Tipos de trens')),

                  DropdownButton<String>(
                    isExpanded: true,
                    value: tremSelecionado,
                    hint: Text("Selecione"),
                    items: lista
                        .map((nome) =>
                            DropdownMenuItem(value: nome, child: Text(nome)))
                        .toList(),
                    onChanged: (value) {
                      tremSelecionado = value!;
                      atualizarInformacoes(value);
                    },
                  ),

                  const SizedBox(height: 10),

                  campoTexto('Avisa se o trem atrasar', aviso),
                  campoTexto('Mostra onde o trem está.', localizacao),
                  campoTexto('Próxima parada', proximaParada),
                  campoTexto('Quanto tempo vai demorar', tempo),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Voltar'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget campoTexto(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            readOnly: true,
            controller: TextEditingController(text: value),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}
