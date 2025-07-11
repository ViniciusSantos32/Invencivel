import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/Dados1.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/Desempenho.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/Eficiencia_operacional.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Relatorio extends StatefulWidget {
  const Relatorio({super.key});

  @override
  State<Relatorio> createState() => _RelatorioState();
}

class _RelatorioState extends State<Relatorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFcbbeb3),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Funções",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildCard(
                      "Dados",
                      MdiIcons.folderTextOutline,
                      dados: true,
                    ),
                    _buildCard(
                      "Desempenho",
                      MdiIcons.chartLine,
                      desempenho: true,
                    ),
                    _buildCard("Status do trem", MdiIcons.trainCarPassenger, EficienciaOperacional: true),
                    _buildCard(
                      "Alerta de imprevisto",
                      MdiIcons.alertCircleOutline,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    String label,
    IconData icon, {
    bool dados = false,
    bool desempenho = false,
    bool EficienciaOperacional = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (dados) {
          Get.to(Dados1());
        } else if (desempenho) {
          Get.to(DesempenhoPage());
        }else if (EficienciaOperacional) {
          Get.to(TelaTrens());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Função $label ainda não implementada')),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
