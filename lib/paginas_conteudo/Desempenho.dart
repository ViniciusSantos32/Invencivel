import 'package:flutter/material.dart';

void main() {
  runApp(const TremApp());
}

class TremApp extends StatelessWidget {
  const TremApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desempenho dos Trens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DesempenhoPage(),
    );
  }
}

class Trem {
  final String nome;
  final int quilometrosRodados;
  final List<String> lugaresVisitados;
  final double valorPassagem;

  Trem({
    required this.nome,
    required this.quilometrosRodados,
    required this.lugaresVisitados,
    this.valorPassagem = 6.0,
  });
}

class DesempenhoPage extends StatelessWidget {
   DesempenhoPage({super.key});

  final List<Trem> trens = [
    Trem(
      nome: "Trem 1",
      quilometrosRodados: 1250,
      lugaresVisitados: ["Lugar 1", "Lugar 2", "Lugar 3"],
    ),
    Trem(
      nome: "Trem 2",
      quilometrosRodados: 980,
      lugaresVisitados: ["Lugar 4", "Lugar 5", "Lugar 6"],
    ),
    Trem(
      nome: "Trem 3",
      quilometrosRodados: 1560,
      lugaresVisitados: ["Lugar 7", "Lugar 8", "Lugar 9"],
    ),
    Trem(
      nome: "Trem 4",
      quilometrosRodados: 720,
      lugaresVisitados: ["Lugar 1", "Lugar 5", "Lugar 9"],
    ),
    Trem(
      nome: "Trem 5",
      quilometrosRodados: 2100,
      lugaresVisitados: ["Lugar 2", "Lugar 6", "Lugar 7"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desempenho'),
      ),
      body: ListView.builder(
        itemCount: trens.length,
        itemBuilder: (context, index) {
          final trem = trens[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trem usado',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    trem.nome,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Quilometro rodado',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '${trem.quilometrosRodados} km',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lugares visitados',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: trem.lugaresVisitados
                        .map((lugar) => Text(
                              lugar,
                              style: const TextStyle(fontSize: 18),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Valor da passagem atual',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'R\$${trem.valorPassagem.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}