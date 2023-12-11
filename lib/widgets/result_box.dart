import 'package:flutter/material.dart';
import 'package:atvd_quiz/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {Key? key, required this.result, required this.questionLength, required this.onPressed})
      : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  // Criação da caixa de alerta com o resultado do quiz
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kTertiaryColor,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Pontuação",
              style: TextStyle(color: kNeutralColor, fontSize: 24.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              radius: 60.0,
              backgroundColor: result == questionLength
                  ? kGreenColor // Quando o resultado for acima da metade das questões a cor será verde 
                  : result < questionLength / 2
                      ? kRedColor // Quando o resultado for menos da metade das questões a cor será vermelho
                      : Colors.amber, // Quando o resultado for metade das questões a cor será amarelo
              child: Text(
                '$result/$questionLength',
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Mensagens com base no resultado
            Text(
              result == questionLength
                  ? 'Muito bem!'
                  : result < questionLength / 2
                      ? 'Estude mais.'
                      : 'Quase lá!',
              style: const TextStyle(color: kNeutralColor),
            ),
            // Botão para reiniciar o jogo
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: onPressed,
              child: const Text(
                'Reiniciar',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
