import 'package:flutter/material.dart';

class BtnLight extends StatelessWidget {
  final String numero;
  final void Function(String) onClick;
  const BtnLight({super.key, required this.numero, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Click $numero");
        this.onClick(this.numero);
      },
      child: Text(this.numero, style: TextStyle(fontSize: 34, color: Colors.white)),
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 173, 232, 221))),
    );
  }
}

class BtnDark extends StatelessWidget {
  final String simbolo;
  const BtnDark({super.key, required this.simbolo});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(this.simbolo, style: TextStyle(fontSize: 24, color: Colors.white)),
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 11, 102, 97))),
    );
  }
}