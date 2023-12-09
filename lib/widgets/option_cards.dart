import 'package:atvd_quiz/constants.dart';
import 'package:flutter/material.dart';

class OptionCards extends StatelessWidget {
  const OptionCards({Key? key, required this.options, required this.color}) : super(key: key);
  final String options;
  final Color color; // variável da cor da opção selecionada

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          options,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: color.red != color.green ? kNeutralColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
