import 'package:flutter/material.dart';

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

  // Informações fictícias para cada trem
  final Map<String, Map<String, String>> infoTrens = {
    'Trem 1': {
      'aviso': 'No horário',
      'localizacao': 'Estação Central',
      'proxima': 'Parada Norte',
      'tempo': '3 minutos'
    },
    'Trem 2': {
      'aviso': 'Atrasado 5 min',
      'localizacao': 'Entre estações',
      'proxima': 'Parada Sul',
      'tempo': '7 minutos'
    },
    'Trem 3': {
      'aviso': 'Adiantado',
      'localizacao': 'Estação Leste',
      'proxima': 'Parada Centro',
      'tempo': '2 minutos'
    },
    'Trem 4': {
      'aviso': 'Atrasado 10 min',
      'localizacao': 'Estação Oeste',
      'proxima': 'Parada Final',
      'tempo': '12 minutos'
    },
    'Trem 5': {
      'aviso': 'No horário',
      'localizacao': 'Estação Norte',
      'proxima': 'Parada Leste',
      'tempo': '5 minutos'
    },
  };

  String aviso = '';
  String localizacao = '';
  String proximaParada = '';
  String tempo = '';

  void atualizarInformacoes(String trem) {
    setState(() {
      aviso = infoTrens[trem]!['aviso']!;
      localizacao = infoTrens[trem]!['localizacao']!;
      proximaParada = infoTrens[trem]!['proxima']!;
      tempo = infoTrens[trem]!['tempo']!;
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Eficiência operacional',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Tipos de trens'),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: tremSelecionado,
                hint: Text("Selecione"),
                items: List.generate(
                  5,
                  (index) => DropdownMenuItem(
                    value: 'Trem ${index + 1}',
                    child: Text('Trem ${index + 1}'),
                  ),
                ),
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Voltar'),
              ),
            ],
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
