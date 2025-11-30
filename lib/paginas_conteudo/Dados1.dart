import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dados1 extends StatefulWidget {
  const Dados1({super.key});

  @override
  State<Dados1> createState() => _TrainDataFormState();
}

class _TrainDataFormState extends State<Dados1> {
  String? _selectedTrainType;

  // CONTROLADORES QUE RECEBEM DADOS DA API
  String cor = "";
  String vagoes = "";
  String velocidade = "";
  String km = "";
  String lugares = "";
  String valor = "";
  String atraso = "";
  String onde = "";
  String proxParada = "";
  String demora = "";

  final _trainTypes = [
    "Trem Bala XPTO", // apenas exemplo
  ];

  // FUNÇÃO PARA BUSCAR API
  Future<void> loadTrainData() async {
    try {
      final url = Uri.parse("http://54.94.119.191:5000/api/trem/1");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          cor = data["cor_trem"] ?? "";
          vagoes = data["vagao_trem"] ?? "";
          velocidade = "${data["velocidade_trem"] ?? 0}";
          km = "${data["kmRodado_trem"] ?? 0} km";
          lugares = data["lugarVisitado_trem"] ?? "";
          valor = "R\$ ${data["valorPassagem_trem"] ?? 0}";
          atraso = data["atraso_trem"] ?? "";
          onde = data["onde_trem"] ?? "";
          proxParada = data["proxParada_trem"] ?? "";
          demora = data["demora_trem"] ?? "";
        });
      }
    } catch (e) {
      print("ERRO AO BUSCAR API: $e");
    }
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
          backgroundColor: const Color(0xFFcbbeb3),
          appBar: AppBar(
            title: const Text('Dados do Trem'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color(0xFFcbbeb3),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: Column(
                children: [
                  // SELECT
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Selecione o trem",
                      ),
                      value: _selectedTrainType,
                      items: _trainTypes.map((t) {
                        return DropdownMenuItem(
                          value: t,
                          child: Text(t),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedTrainType = value;
                        });
                        loadTrainData();
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  if (_selectedTrainType != null) ...[
                    // HEADER
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.train, size: 40, color: Colors.black),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _selectedTrainType!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Cor: $cor | Vagões: $vagoes | Vel: $velocidade km/h",
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // GRID
                    if (isMobile) ...[
                      _buildInfoContainer(
                        title: "KM rodados",
                        value: km,
                        icon: Icons.speed,
                        color: Colors.blue,
                        isMobile: true,
                      ),
                      const SizedBox(height: 16),
                      _buildInfoContainer(
                        title: "Lugares visitados",
                        value: lugares,
                        icon: Icons.place,
                        color: Colors.green,
                        isMobile: true,
                      ),
                      const SizedBox(height: 16),
                      _buildInfoContainer(
                        title: "Valor passagem",
                        value: valor,
                        icon: Icons.attach_money,
                        color: Colors.purple,
                        isMobile: true,
                      ),
                    ] else ...[
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          _buildInfoContainer(
                            title: "KM rodados",
                            value: km,
                            icon: Icons.speed,
                            color: Colors.blue,
                          ),
                          _buildInfoContainer(
                            title: "Lugares visitados",
                            value: lugares,
                            icon: Icons.place,
                            color: Colors.green,
                          ),
                          _buildInfoContainer(
                            title: "Valor passagem",
                            value: valor,
                            icon: Icons.attach_money,
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    ],
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
