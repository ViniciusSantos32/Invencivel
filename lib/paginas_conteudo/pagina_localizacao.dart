import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaginaLocalizacao extends StatefulWidget {
  const PaginaLocalizacao({super.key});

  @override
  _PaginaLocalizacaoState createState() => _PaginaLocalizacaoState();
}

class _PaginaLocalizacaoState extends State<PaginaLocalizacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFcbbeb3)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 50,
                child: Center(
                  child: Text(
                    "Aonde você quer ir?",
                    style: GoogleFonts.bangers(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Image.network(
              "https://img.odcdn.com.br/wp-content/uploads/2018/12/20181218065336.jpg",
              height: 300,
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 50,
                child: Center(
                  child: Text(
                    "Diga o tipo de transporte",
                    style: GoogleFonts.bangers(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
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
