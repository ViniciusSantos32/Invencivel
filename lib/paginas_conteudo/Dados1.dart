import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Dados1 extends StatefulWidget {
  const Dados1({super.key});

  @override
  State<Dados1> createState() => _TrainDataFormState();
}

class _TrainDataFormState extends State<Dados1> {
  final _formKey = GlobalKey<FormState>();
  final _trainTypes = [
    'Metrô',
    'Trem Urbano',
    'Trem Regional',
    'Trem de Carga',
    'Trem Bala',
  ];
  String? _selectedTrainType;
  final _colorController = TextEditingController();
  final _wagonCountController = TextEditingController();
  final _speedController = TextEditingController();

  // Dados pré-definidos para cada tipo de trem - AGORA COM TODOS OS CAMPOS NECESSÁRIOS
  final Map<String, Map<String, dynamic>> _trainPresets = {
    'Metrô': {
      'color': 'Azul',
      'wagonCount': '6',
      'speed': '80',
      'km': '150 km',
      'places': 'Terminal 1 e Terminal 2',
      'ticketPrice': '5.50',
    },
    'Trem Urbano': {
      'color': 'Verde',
      'wagonCount': '4',
      'speed': '60',
      'km': '100 km',
      'places': 'Terminal 1 e Terminal 2',
      'ticketPrice': '5.50',
    },
    'Trem Regional': {
      'color': 'Vermelho',
      'wagonCount': '8',
      'speed': '100',
      'km': '300 km',
      'places': 'Terminal Central e Terminal Norte',
      'ticketPrice': '15.00',
    },
    'Trem de Carga': {
      'color': 'Laranja',
      'wagonCount': '20',
      'speed': '70',
      'km': '500 km',
      'places': 'Porto e Centro de Distribuição',
      'ticketPrice': '0.00',
    },
    'Trem Bala': {
      'color': 'Branco',
      'wagonCount': '10',
      'speed': '300',
      'km': '600 km',
      'places': 'Capital e Cidade Turística',
      'ticketPrice': '120.00',
    },
  };

  Widget _buildInfoCard({
    required String title,
    required String value,
    required bool mobile,
    required double fontSize,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: mobile ? const EdgeInsets.all(12) : const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: fontSize)),
            Text(value, style: TextStyle(fontSize: fontSize)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _colorController.dispose();
    _wagonCountController.dispose();
    _speedController.dispose();
    super.dispose();
  }

  void _fillTrainData(String? trainType) {
    if (trainType == null || !_trainPresets.containsKey(trainType)) return;
    final preset = _trainPresets[trainType]!;
    setState(() {
      _colorController.text = preset['color'];
      _wagonCountController.text = preset['wagonCount'];
      _speedController.text = preset['speed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = 
        sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Scaffold(
          appBar: AppBar(title: const Text('Dados do Trem')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Seletor de trem
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Trem usado',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedTrainType,
                  items:
                      _trainTypes.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedTrainType = value;
                    });
                    _fillTrainData(value);
                  },
                ),

                const SizedBox(height: 24),

                if (_selectedTrainType != null)
                  isMobile ? _buildMobileLayout() : _buildDesktopLayout()
                else
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        'Selecione um tipo de trem para ver os dados',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout() {
    final data = _trainPresets[_selectedTrainType]!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        children: [
          _buildInfoCard(
            title: 'Quilômetros rodados',
            value: data['km'] ?? 'N/A',
            mobile: true,
            fontSize: 14,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'Lugares visitados',
            value: data['places'] ?? 'N/A',
            mobile: true,
            fontSize: 14,
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            title: 'Valor da passagem atual',
            value: 'R\$ ${data['ticketPrice'] ?? '0.00'}',
            mobile: true,
            fontSize: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    final data = _trainPresets[_selectedTrainType]!;
    return Row(
      // Alterado de Column para Row
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildInfoCard(
            title: 'Quilômetros rodados',
            value: data['km'] ?? 'N/A',
            mobile: false,
            fontSize: 18, // Corrigido o fontSize
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _buildInfoCard(
            title: 'Lugares visitados',
            value: data['places'] ?? 'N/A',
            mobile: false,
            fontSize: 18, // Corrigido o fontSize
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _buildInfoCard(
            title: 'Valor da passagem atual',
            value: 'R\$ ${data['ticketPrice'] ?? '0.00'}',
            mobile: false,
            fontSize: 18, // Corrigido o fontSize
          ),
        ),
      ],
    );
  }
}
