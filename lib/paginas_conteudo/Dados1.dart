import 'package:flutter/material.dart';
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

  final Map<String, Map<String, dynamic>> _trainPresets = {
    'Metrô': {
      'color': 'Azul',
      'wagonCount': '6',
      'speed': '80',
      'km': '150 km',
      'places': 'Terminal 1, Terminal 2',
      'ticketPrice': '5.50',
      'icon': Icons.subway,
      'colorValue': Colors.blue,
    },
    'Trem Urbano': {
      'color': 'Verde',
      'wagonCount': '4',
      'speed': '60',
      'km': '100 km',
      'places': 'Terminal 1, Terminal 2',
      'ticketPrice': '5.50',
      'icon': Icons.train,
      'colorValue': Colors.green,
    },
    'Trem Regional': {
      'color': 'Vermelho',
      'wagonCount': '8',
      'speed': '100',
      'km': '300 km',
      'places': 'Terminal Central, Terminal Norte',
      'ticketPrice': '15.00',
      'icon': Icons.directions_railway,
      'colorValue': Colors.red,
    },
    'Trem de Carga': {
      'color': 'Laranja',
      'wagonCount': '20',
      'speed': '70',
      'km': '500 km',
      'places': 'Porto, Centro de Distribuição',
      'ticketPrice': '0.00',
      'icon': Icons.local_shipping,
      'colorValue': Colors.orange,
    },
    'Trem Bala': {
      'color': 'Branco',
      'wagonCount': '10',
      'speed': '300',
      'km': '600 km',
      'places': 'Capital, Cidade Turística',
      'ticketPrice': '120.00',
      'icon': Icons.airplanemode_active,
      'colorValue': Colors.white,
    },
  };

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

  Widget _buildInfoContainer({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    bool isMobile = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: isMobile ? 30 : 40, color: color),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: isMobile ? 18 : 22,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        return Scaffold(
          backgroundColor: Color(0xFFcbbeb3),
          appBar: AppBar(
            title: const Text('Dados do Trem'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color(0xFFcbbeb3),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
              child: Column(
                children: [
                  // Seletor de trem
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Selecione o tipo de trem',
                        labelStyle: TextStyle(color: Colors.blueGrey),
                      ),
                      value: _selectedTrainType,
                      items:
                          _trainTypes.map((type) {
                            final color =
                                _trainPresets[type]!['colorValue'] as Color;
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Row(
                                children: [
                                  Icon(
                                    _trainPresets[type]!['icon'],
                                    color: color,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(type),
                                ],
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedTrainType = value;
                        });
                        _fillTrainData(value);
                      },
                      isExpanded: true,
                    ),
                  ),

                  const SizedBox(height: 24),

                  if (_selectedTrainType != null) ...[
                    // Header com informações básicas
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _trainPresets[_selectedTrainType]!['icon'],
                            size: 40,
                            color:
                                _trainPresets[_selectedTrainType]!['colorValue'],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _selectedTrainType!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Cor: ${_trainPresets[_selectedTrainType]!['color']} | '
                                  'Vagões: ${_trainPresets[_selectedTrainType]!['wagonCount']} | '
                                  'Velocidade: ${_trainPresets[_selectedTrainType]!['speed']} km/h',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Grid de informações
                    if (isMobile) ...[
                      Column(
                        children: [
                          _buildInfoContainer(
                            title: 'Quilômetros rodados',
                            value: _trainPresets[_selectedTrainType]!['km'],
                            icon: Icons.speed,
                            color: Colors.blue,
                            isMobile: true,
                          ),
                          const SizedBox(height: 16),
                          _buildInfoContainer(
                            title: 'Lugares visitados',
                            value: _trainPresets[_selectedTrainType]!['places'],
                            icon: Icons.place,
                            color: Colors.green,
                            isMobile: true,
                          ),
                          const SizedBox(height: 16),
                          _buildInfoContainer(
                            title: 'Valor da passagem',
                            value:
                                'R\$${_trainPresets[_selectedTrainType]!['ticketPrice']}',
                            icon: Icons.attach_money,
                            color: Colors.purple,
                            isMobile: true,
                          ),
                        ],
                      ),
                    ] else ...[
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.0,
                        children: [
                          _buildInfoContainer(
                            title: 'Quilômetros rodados',
                            value: _trainPresets[_selectedTrainType]!['km'],
                            icon: Icons.speed,
                            color: Colors.blue,
                          ),
                          _buildInfoContainer(
                            title: 'Lugares visitados',
                            value: _trainPresets[_selectedTrainType]!['places'],
                            icon: Icons.place,
                            color: Colors.green,
                          ),
                          _buildInfoContainer(
                            title: 'Valor da passagem',
                            value:
                                'R\$${_trainPresets[_selectedTrainType]!['ticketPrice']}',
                            icon: Icons.attach_money,
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    ],
                  ] else ...[
                    Container(
                      padding: const EdgeInsets.all(24),
                      margin: const EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.train, size: 50, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          const Text(
                            'Selecione um tipo de trem para visualizar os dados',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
