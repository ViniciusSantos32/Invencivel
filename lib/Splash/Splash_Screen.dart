import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:
        
         LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
        Colors.black,
        Color.fromARGB(255, 0, 44, 241),

      ]),
      ),
      child: 
  Padding(padding: EdgeInsets.only(top: 350), child:  Column(
            
            children: [
              Text("PIUI TRAIN", style: GoogleFonts.russoOne(textStyle: TextStyle(color: const Color.fromARGB(255, 0, 44, 241),decoration: TextDecoration.none, fontWeight: FontWeight.bold)) ),
                    ],
                      ),
                        ),
                          );
                              
  }
}