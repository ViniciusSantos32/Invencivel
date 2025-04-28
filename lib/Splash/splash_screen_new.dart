import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:invencivelemtfodasimfdsovinicius/P%C3%A1gina_inicial/pagina_inicial_login.dart';

class SplashScreenNew extends StatefulWidget {
  const SplashScreenNew({super.key});

  @override
  State<SplashScreenNew> createState() => _SplashScreenNewState();
}

class _SplashScreenNewState extends State<SplashScreenNew> {
  @override
  void initState() {
    super.initState();
    print("aldjawljandbwçdbahidwabpa");
  }

  Future<void> navegarparapaginainicial() async {
    await Future.delayed(Duration(seconds: 5));

    Get.to(PaginaInicialLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.black, Color.fromARGB(255, 0, 44, 241)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 350),
        child: Column(
          children: [
            Text(
              "PIUI TRAIN",
              style: GoogleFonts.russoOne(
                textStyle: TextStyle(
                  color: const Color.fromARGB(255, 0, 44, 241),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
