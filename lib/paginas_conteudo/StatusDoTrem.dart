import 'package:flutter/material.dart';

void main() {
  runApp(const TremApp());
}

class TremApp extends StatelessWidget {
  const TremApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Status do Trem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TremStatusPage(),
    );
  }
}

class TremStatusPage extends StatefulWidget {
  const TremStatusPage({super.key});

  @override
  State<TremStatusPage> createState() => _TremStatusPageState();
}

class _TremStatusPageState extends State<TremStatusPage> {
  String? selectedTrem = 'Horario 1';
  final Map<String, String> horarios = {
    'Horario 1': '08:00 - Partida da Estação Central',
    'Horario 2': '10:30 - Chegada na Estação Norte',
    'Horario 3': '13:15 - Partida da Estação Sul',
    'Horario 4': '16:45 - Chegada na Estação Leste',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status do Trem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tipos de trens',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedTrem,
              isExpanded: true,
              items: horarios.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedTrem = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            if (selectedTrem != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Horário do $selectedTrem',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(horarios[selectedTrem]!),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}