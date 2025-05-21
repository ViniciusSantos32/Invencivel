import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invencivelemtfodasimfdsovinicius/Página_inicial/criacao_de_conta.dart';
import 'package:invencivelemtfodasimfdsovinicius/controllers/Customtextfield.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/bottom_navigation_controller.dart';

class PaginainicialLogin extends StatelessWidget {
  PaginainicialLogin({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFcbbeb3),
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
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200, right: 20, left: 20),
                child: Column(
                  children: [
                    Customtextfield(
                      labeltext: "Email",
                      controller: email,
                      obscureText: false,
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Coloque um email";
                        } else if (!value.contains("@")) {
                          return "Coloque um email válido";
                        }else{
                        return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                child: Customtextfield(
                  labeltext: "Senha",
                  controller: senha,
                  obscureText: true,
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Coloque uma senha";
                    }
                    return null;
                  },
                ),
              ),

              // Botão com hover
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: HoverButton(onPressed: () {
                  if (_key.currentState!.validate()) {
                    Get.to(() => BottomNavigationController());
                  }
                }),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("ou"),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Text("Não tem uma conta?"),
              TextButton(
                onPressed: () {
                  Get.to(CriacaoDeConta());
                },
                style: TextButton.styleFrom(backgroundColor: Colors.transparent),
                child: Text("crie uma clicando aqui"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget separado para aplicar o efeito de hover no botão
class HoverButton extends StatefulWidget {
  final VoidCallback onPressed;

  const HoverButton({required this.onPressed, super.key});

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        transform: Matrix4.translationValues(0, isHovered ? -5 : 0, 0),
        child: SizedBox(
          height: 50,
          width: 200,
          child: TextButton(
            onPressed: widget.onPressed,
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              "Acessar",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}