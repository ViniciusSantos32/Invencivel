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
        cardTheme: CardThemeData(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const DesempenhoPage(),
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

class DesempenhoPage extends StatefulWidget {
  const DesempenhoPage({super.key});

  @override
  State<DesempenhoPage> createState() => _DesempenhoPageState();
}

class _DesempenhoPageState extends State<DesempenhoPage> {
  Trem? tremSelecionado;
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
      backgroundColor: Color(0xFFcbbeb3),
      appBar: AppBar(title: const Text('Desempenho'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: DropdownButtonFormField<Trem>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Selecione um trem',
                    ),
                    value: tremSelecionado,
                    items:
                        trens.map((Trem trem) {
                          return DropdownMenuItem<Trem>(
                            value: trem,
                            child: Text(trem.nome),
                          );
                        }).toList(),
                    onChanged: (Trem? novoValor) {
                      setState(() {
                        tremSelecionado = novoValor;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                if (tremSelecionado != null) ...[
                  // Container para Trem usado
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Trem usado',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tremSelecionado!.nome,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Container para Quilômetro rodado
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Quilômetro rodado',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${tremSelecionado!.quilometrosRodados} km',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Container para Lugares visitados
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Lugares visitados',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Column(
                          children:
                              tremSelecionado!.lugaresVisitados
                                  .map(
                                    (lugar) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
                                      child: Text(
                                        lugar,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Container para Valor da passagem
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Valor da passagem atual',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'R\$${tremSelecionado!.valorPassagem.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Selecione um trem para visualizar as informações',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
