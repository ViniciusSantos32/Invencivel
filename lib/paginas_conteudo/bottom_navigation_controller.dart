import 'package:flutter/material.dart';
import 'package:invencivelemtfodasimfdsovinicius/P%C3%A1gina_inicial/Dados.dart';
import 'package:invencivelemtfodasimfdsovinicius/paginas_conteudo/pagina_localizacao.dart';

class BottomNavigationController extends StatefulWidget {
  const BottomNavigationController({super.key});

  @override
  State<BottomNavigationController> createState() => _BottomNavigationControllerState();
}

class _BottomNavigationControllerState extends State<BottomNavigationController> {

  
      int _selectedIndex = 0;
  final List<Widget> _pages = [
    PaginaLocalizacao(),
    Dados(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:     _pages[_selectedIndex],
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
            label: "Histórico",
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