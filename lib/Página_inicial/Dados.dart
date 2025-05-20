import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  const Dados({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dados do Trem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TrainDataForm(),
    );
  }
}

class TrainDataForm extends StatefulWidget {
  const TrainDataForm({super.key});

  @override
  State<TrainDataForm> createState() => _TrainDataFormState();
}

class _TrainDataFormState extends State<TrainDataForm> {
  final _formKey = GlobalKey<FormState>();
  final _trainTypes = ['Metrô', 'Trem Urbano', 'Trem Regional', 'Trem de Carga', 'Trem Bala'];
  String? _selectedTrainType;
  final _colorController = TextEditingController();
  final _wagonCountController = TextEditingController();
  final _speedController = TextEditingController();

  @override
  void dispose() {
    _colorController.dispose();
    _wagonCountController.dispose();
    _speedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados do Trem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Select para Tipos de trens
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tipos de trens',
                  border: OutlineInputBorder(),
                ),
                value: _selectedTrainType,
                items: _trainTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTrainType = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Selecione um tipo de trem';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Campo para Cor do trem
              TextFormField(
                controller: _colorController,
                decoration: const InputDecoration(
                  labelText: 'Cor do trem',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a cor do trem';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Campo para Quantidade de vagões
              TextFormField(
                controller: _wagonCountController,
                decoration: const InputDecoration(
                  labelText: 'Quantidade de vagões',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a quantidade de vagões';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Digite um número válido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Campo para Velocidade do trem (km)
              TextFormField(
                controller: _speedController,
                decoration: const InputDecoration(
                  labelText: 'Velocidade do trem (km/h)',
                  border: OutlineInputBorder(),
                  suffixText: 'km/h',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a velocidade do trem';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Digite um número válido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Dados salvos com sucesso!')),
                      );
                    }
                  },
                  child: const Text('Salvar Dados'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}