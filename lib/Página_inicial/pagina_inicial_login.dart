import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invencivelemtfodasimfdsovinicius/controllers/Customtextfield.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/pagina_localizacao.dart';

class PaginainicialLogin extends StatelessWidget {
  PaginainicialLogin({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black, Color.fromARGB(255, 0, 44, 241)],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                "PIUI TRAIN",
                style: GoogleFonts.russoOne(
                  textStyle: TextStyle(
                    fontSize: 50,
                    color: const Color.fromARGB(255, 0, 44, 241),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
              child: Column(
                children: [
                  Customtextfield(labeltext: "Email", controller: email),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
              child: Customtextfield(labeltext: "Senha", controller: senha),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
              child: SizedBox(
                height: 50,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => PaginaLocalizacao());
                  },
                  child: Text("Acessar", style: TextStyle(color: Colors.black, fontSize: 16)),
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
