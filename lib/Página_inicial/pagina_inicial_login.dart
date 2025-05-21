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
    final size = MediaQuery.of(context).size;
    final double topPadding = size.height * 0.1;
    final double fieldSpacing = size.height * 0.03;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: topPadding),
                Center(
                  child: Text(
                    "PIUI TRAIN",
                    style: GoogleFonts.russoOne(
                      textStyle: TextStyle(
                        fontSize: size.width * 0.1,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.15),
                Customtextfield(
                  labeltext: "Email",
                  controller: email,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Coloque um email";
                    } else if (!value.contains("@")) {
                      return "Coloque um email válido";
                    }
                    return null;
                  },
                ),
                SizedBox(height: fieldSpacing),
                Customtextfield(
                  labeltext: "Senha",
                  controller: senha,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Coloque uma senha";
                    }
                    return null;
                  },
                ),
                SizedBox(height: fieldSpacing),
                HoverButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      Get.to(() => BottomNavigationController());
                    }
                  },
                ),
                SizedBox(height: fieldSpacing),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1, color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("ou"),
                    ),
                    Expanded(child: Divider(thickness: 1, color: Colors.white)),
                  ],
                ),
                SizedBox(height: 10),
                Text("Não tem uma conta?"),
                TextButton(
                  onPressed: () {
                    Get.to(CriacaoDeConta());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text("Crie uma clicando aqui"),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFcbbeb3),
    );
  }
}

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
        duration: const Duration(milliseconds: 150),
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
