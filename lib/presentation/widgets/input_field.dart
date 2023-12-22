import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InputField extends StatelessWidget {
  const InputField(
      {required this.controller, required this.labelText, this.obscure = false, super.key});

  final TextEditingController controller;
  final String labelText;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
            label: Text(labelText), border: OutlineInputBorder()));
  }
}
