import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invencivelemtfodasimfdsovinicius/P%C3%A1gina_inicial/Dados.dart';
import 'package:invencivelemtfodasimfdsovinicius/controllers/Customtextfield.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/relatorio.dart';

class PaginaLocalizacao extends StatefulWidget {
  const PaginaLocalizacao({super.key});

  @override
  _PaginaLocalizacaoState createState() => _PaginaLocalizacaoState();
}

int _currentIndex = 0;

void SelectIndex(int index){
    _currentIndex = index;

    switch(index){
      case 0:
      Get.to(PaginaLocalizacao());
      break;

      case 1:
      Get.to(Relatorio());
      break;
    }
}

class _PaginaLocalizacaoState extends State<PaginaLocalizacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFcbbeb3)
        ),
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
              "https://th.bing.com/th/id/OIP.iYHHu-1rybpPl0S4qMHjCQHaKd?cb=iwp2&rs=1&pid=ImgDetMain",
              height: 500,
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
