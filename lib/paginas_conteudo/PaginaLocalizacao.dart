import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PaginaLocalizacao extends StatelessWidget {
  const PaginaLocalizacao({super.key});

  final double lat = -26.31378349750969;
  final double lng = -48.828728095070275;

  Future<void> _abrirGoogleMaps() async {
    final url = "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
    final uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Não foi possível abrir o Google Maps.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFcbbeb3),
        child: Column(
          children: [
            const SizedBox(height: 80),

            // TÍTULO
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Aonde você quer ir?",
                  style: GoogleFonts.bangers(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // IMAGEM DO MAPA ESTÁTICA CLICÁVEL
            GestureDetector(
              onTap: _abrirGoogleMaps,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://maps.googleapis.com/maps/api/staticmap?"
                  "center=$lat,$lng&zoom=15&size=600x400&markers=color:red|$lat,$lng",
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // SEGUNDA CAIXA
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Diga o tipo de transporte",
                  style: GoogleFonts.bangers(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}