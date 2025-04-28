import 'package:flutter/material.dart';

class Customtextfield extends StatefulWidget {
  const Customtextfield({
    super.key,
    required this.labeltext,
    required this.controller,
  });

  final String labeltext;

  final TextEditingController controller;

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
