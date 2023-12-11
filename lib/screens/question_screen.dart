import 'package:atvd_quiz/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:atvd_quiz/models/questions_model.dart';
import 'package:atvd_quiz/constants.dart';
import 'package:atvd_quiz/widgets/question_widget.dart';
import 'package:atvd_quiz/widgets/option_cards.dart';
import 'package:atvd_quiz/widgets/result_box.dart';

class QuizAppWidget extends StatefulWidget {
  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizAppWidget> {
  List<Question> questions = [
    Question(
      id: '1',
      title: 'Qual é a linguagem de programação principal do Flutter?',
      options: {
        'Java': false,
        'Dart': true,
        'C++': false,
        'Python': false,
        'JavaScript': false
      },
    ),
    Question(
      id: '2',
      title: 'O que são widgets no Flutter?',
      options: {
        'Peças de quebra-cabeça': false,
        'Componentes de interface do usuário': true,
        'Comandos de terminal': false,
        'Marcadores de posição': false,
        'Ponteiros de memória': false,
      },
    ),
    // Question(
    //   id: '3',
    //   title:
    //       'Como é chamado o recurso no Flutter que permite visualizar instantaneamente as mudanças feitas no código?',
    //   options: {
    //     'QuickView': false,
    //     'LiveReload': false,
    //     'Hot Reload': true,
    //     'FastTrack': false,
    //     'SwiftLoad': false
    //   },
    // ),
    // Question(
    //   id: '4',
    //   title: 'Qual comando é usado para instalar dependências no Flutter?',
    //   options: {
    //     'get install': false,
    //     'pub get': false,
    //     'flutter add': false,
    //     'dependencies install': false,
    //     'flutter pub install': true
    //   },
    // ),
    // Question(
    //   id: '5',
    //   title: 'O que é o "State" em Flutter, em relação a widgets?',
    //   options: {
    //     'Estado emocional do desenvolvedor': false,
    //     'Conjunto de dados imutáveis': false,
    //     'Propriedades visuais de um widget': false,
    //     'Armazenamento local': false,
    //     'Estado dinâmico de um widget': true
    //   },
    // ),
    // Question(
    //   id: '6',
    //   title:
    //       'Qual é o formato de arquivo usado para definir as dependências do projeto Flutter?',
    //   options: {
    //     '.json': false,
    //     '.yml': true,
    //     '.txt': false,
    //     '.cfg': false,
    //     '.yaml': false
    //   },
    // ),
    // Question(
    //   id: '7',
    //   title: 'O que é o Flutter SDK?',
    //   options: {
    //     'Software Development Kit específico para Flutter': true,
    //     'Sistema de Design para Flutter': false,
    //     'Serviço de Delivery para Flutter': false,
    //     'Super Dynamic Kit': false,
    //     'Script de Desenvolvimento para Kotlin': false
    //   },
    // ),
    // Question(
    //   id: '8',
    //   title:
    //       'Como é chamada a estrutura de layout básica no Flutter que organiza os widgets em uma grade?',
    //   options: {
    //     'Grid Layout': false,
    //     'RowColumn Structure': false,
    //     'Flexbox': false,
    //     'Scaffold': true,
    //     'GridLayout': false
    //   },
    // ),
    // Question(
    //   id: '9',
    //   title: 'O que é o Flutter Doctor e para que serve?',
    //   options: {
    //     'Ferramenta de diagnóstico para saúde do desenvolvedor': true,
    //     'Plugin para edição de imagens': false,
    //     'Assistente virtual no Flutter': false,
    //     'Módulo de aprendizado de máquina': false,
    //     'Emulador de dispositivos móveis': false
    //   },
    // ),
    // Question(
    //   id: '10',
    //   title: 'Qual é a função do widget MaterialApp em um aplicativo Flutter?',
    //   options: {
    //     'Definir o tema do aplicativo': false,
    //     'Manipular a navegação entre telas': false,
    //     'Criar uma barra de aplicativo padrão': false,
    //     'Iniciar o aplicativo': false,
    //     'Todas as opções anteriores': true
    //   },
    // ),
  ];

  bool isPressed = false; // valor booleano para checar se o usuário clicou
  int questionsIndex = 0; // loop que percore a lista de questões
  int score = 0; // variavel de pontuação\
  bool isAlreadySelected = false;

  // função para iniciar o jogo novamente
  void startOver() {
    setState(() {
      questionsIndex = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  // função para mostrar a próxima questão
  void nextQuestion() {
    if (questionsIndex == questions.length - 1) {
      // fim das questões == result_box
      showDialog(
          context: context,
          barrierDismissible:
              false, // desativa a "dismiss function clicking" fora da caixa
          builder: (ctx) => ResultBox(
                result: score, // pontuação total
                questionLength: questions.length,
                onPressed:
                    startOver, // quando pressionado, chamará a função "onPressed" e irá retornar ao inicio
              ));
    } else {
      if (isPressed) {
        setState(() {
          questionsIndex++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Por favor, selecione uma alternativa.'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
        ));
      }
    }
  }

  // função checa se a questão correta, e adiciona +1 ao score
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTertiaryColor,
      appBar: AppBar(
        title: const Text('SENAI Quiz'),
        backgroundColor: kTertiaryColor,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Pontuação: $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: questionsIndex, // inicialmente é 0
              question: questions[questionsIndex]
                  .title, // significa a primeira pergunta da lista.
              totalQuestions: questions.length, // total de questões da lista
            ),
            const Divider(
              color: kNeutralColor,
            ),
            // opcoes das questoes
            const SizedBox(
              height: 25.0,
            ),
            for (int i = 0; i < questions[questionsIndex].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    questions[questionsIndex].options.values.toList()[i]),
                child: OptionCards(
                  options: questions[questionsIndex].options.keys.toList()[i],
                  color: isPressed
                      ? questions[questionsIndex].options.values.toList()[i] ==
                              true
                          ? kGreenColor // cor correta
                          : kRedColor // cor incorreta
                      : kNeutralColor, // cor neutra
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
