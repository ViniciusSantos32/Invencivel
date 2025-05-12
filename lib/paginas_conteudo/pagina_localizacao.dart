import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invencivelemtfodasimfdsovinicius/controllers/Customtextfield.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.share_location_rounded),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_rounded),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: "",
          ),
        ],
      ),
    );
  }
}
