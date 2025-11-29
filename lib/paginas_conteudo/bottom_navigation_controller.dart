import 'package:flutter/material.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/Dados1.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/PaginaLocalizacao.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/Pagina_Perfil.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/funcoes.dart';

class BottomNavigationController extends StatefulWidget {
  const BottomNavigationController({super.key});

  @override
  State<BottomNavigationController> createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    PaginaLocalizacao(),
    Relatorio(),
    UserProfileApp(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.share_location_rounded),
            label: "Mapa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_rounded),
            label: "Funções",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
