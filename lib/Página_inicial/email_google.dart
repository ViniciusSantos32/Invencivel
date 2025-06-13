import 'package:flutter/material.dart';

class EmailGoogle extends StatelessWidget {
  const EmailGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFcbbeb3),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Vai no google e cria uma conta lá',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
