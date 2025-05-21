import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
          child: ListView(
            children: [
              // Seletor para Tipos de trens
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tipo de trem',
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
                  hintText: 'Ex: Vermelho',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a cor do trem';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Campo para Quantidade de vagões (apenas números inteiros)
              TextFormField(
                controller: _wagonCountController,
                decoration: const InputDecoration(
                  labelText: 'Quantidade de vagões',
                  border: OutlineInputBorder(),
                  hintText: 'Ex: 8',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a quantidade de vagões';
                  }
                  final number = int.tryParse(value);
                  if (number == null) {
                    return 'Digite um número válido';
                  }
                  if (number <= 0) {
                    return 'Deve ter pelo menos 1 vagão';
                  }
                  if (number > 50) {
                    return 'Número muito alto (máx. 50 vagões)';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Campo para Velocidade do trem (apenas números decimais)
              TextFormField(
                controller: _speedController,
                decoration: const InputDecoration(
                  labelText: 'Velocidade do trem (km/h)',
                  border: OutlineInputBorder(),
                  suffixText: 'km/h',
                  hintText: 'Ex: 120.5',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a velocidade do trem';
                  }
                  final number = double.tryParse(value);
                  if (number == null) {
                    return 'Digite apenas números';
                  }
                  if (number <= 0) {
                    return 'A velocidade deve ser maior que zero';
                  }
                  if (number > 600) {
                    return 'Velocidade muito alta (máx. 600 km/h)';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Botão de envio
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Mostrar dados no console para debug
                    print('Tipo de trem: $_selectedTrainType');
                    print('Cor: ${_colorController.text}');
                    print('Vagões: ${_wagonCountController.text}');
                    print('Velocidade: ${_speedController.text} km/h');
                    
                    // Mostrar mensagem de sucesso
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Dados do trem salvos com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Salvar Dados do Trem'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}