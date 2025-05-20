import 'package:flutter/material.dart';

class Customtextfield extends StatefulWidget {
  const Customtextfield({
    super.key,
    required this.labeltext,
    required this.controller,
    this.validator,
    this.obscureText = false
  });

  final String labeltext;

  final String? Function(String?)? validator;

  final TextEditingController controller;

  final bool obscureText;

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
  bool _obscureTExt = true;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        suffixIcon:  widget.obscureText ? IconButton(onPressed: (){
          _obscureTExt = !_obscureTExt;
        }, icon: _obscureTExt ?  Icon(Icons.visibility) : Icon(Icons.visibility_off),) : null
      ),
      obscureText: _obscureTExt,
      validator: widget.validator,
    );
  }
}
