import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:technoed/models/dificuldade.dart';
import 'package:technoed/models/forma.dart';
import 'package:technoed/pages/pergunta_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TesteTangramPage extends StatefulWidget {
  const TesteTangramPage({Key? key}) : super(key: key);

  @override
  _TesteTangramPageState createState() => _TesteTangramPageState();
}

class _TesteTangramPageState extends State<TesteTangramPage> {
  List<Forma> pecas = Dificuldades().niveis[0].shapes;
  int shapeOfCount = 0;
  int shapeCount = 0;

  List<String> listaPerguntas = [
    'Quantas letras tem a palavra "paralelepípedo"?',
    'Qual é o resultado da soma: 2 + 5?',
    'O Brasil foi colônia de qual país?',
    'Qual destes países não se localiza na América do Sul?',
    '"Comer" é um:',
    'A palavra "Angry" em português equivale à?',
    'Que país tem o formato de uma bota?',
  ];

  List<String> listaAlternativas = [
    '13',
    '14',
    '12',
    '6',
    '9',
    '7',
    'Portugal',
    'Espanha',
    'Inglaterra',
    'Bolívia',
    'Suriname',
    'Angola',
    'Adjetivo',
    'Verbo',
    'Pronome',
    'Medo',
    'Raiva',
    'Fome',
    'Brasil',
    'Itália',
    'México',
  ];

  List<String> listaRespostas = [
    '14',
    '7',
    'Portugal',
    'Angola',
    'Verbo',
    'Raiva',
    'Itália',
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      pecas = Dificuldades().niveis[9].shapes;
      shapeOfCount = Dificuldades().niveis[9].shapeOfCount;
    });
  }

  bool tangramFinalizado() {
    if (shapeOfCount == shapeCount) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 202, 240, 248),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              foregroundColor: const Color.fromARGB(255, 143, 146, 148),
              toolbarHeight: 60,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Clique nas peças para responder as\nperguntas e use-as para montar a figura',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 143, 146, 148),
                        fontSize: 15),
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
          ...pecas.map(
            (shapeModel) => Positioned(
              top: shapeModel.targetPosition.x,
              left: shapeModel.targetPosition.y,
              child: DragTarget<Forma>(
                builder: (context, candidateData, rejectedData) =>
                    RotationTransition(
                  turns: AlwaysStoppedAnimation(shapeModel.rotationAngle),
                  child: ClipPath(
                    child: Container(
                      color: shapeModel.targetColor,
                      width: shapeModel.width,
                      height: shapeModel.height,
                    ),
                    clipper: shapeModel.shape,
                  ),
                ),
                onWillAccept: (data) {
                  return true;
                },
                onAccept: (data) {
                  if (data.id == shapeModel.id) {
                    setState(
                      () {
                        data.isPlaced = true;
                        data.targetColor = data.color;
                        shapeCount++;
                        if (tangramFinalizado()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              actionsAlignment: MainAxisAlignment.center,
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    MdiIcons.trophyVariantOutline,
                                    color: Colors.amber,
                                    size: 40,
                                  ),
                                ],
                              ),
                              content: SizedBox(
                                width: 300,
                                height: 80,
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      'Parabéns!\n\nVocê concluiu o treinamento!',
                                      //speed: const Duration(milliseconds: 400),
                                      textAlign: TextAlign.center,
                                      textStyle: const TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Ok'),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          ).then((value) => Navigator.pop(context));
                        }
                      },
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: 'Você errou! Tente novamente!',
                      toastLength: Toast.LENGTH_LONG,
                      backgroundColor: const Color.fromARGB(255, 245, 81, 81),
                    );
                  }
                },
              ),
            ),
          ),
          ...pecas.map(
            (shapeModel) => (shapeModel.isPlaced)
                ? Container()
                : Positioned(
                    top: shapeModel.position.y,
                    left: shapeModel.position.x,
                    child: Draggable(
                      feedback: RotationTransition(
                        turns: AlwaysStoppedAnimation(shapeModel.rotationAngle),
                        child: ClipPath(
                          child: Container(
                            color: shapeModel.color,
                            width: shapeModel.width,
                            height: shapeModel.height,
                          ),
                          clipper: shapeModel.shape,
                        ),
                      ),
                      data: shapeModel,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(shapeModel.rotationAngle),
                        child: ClipPath(
                          child: Container(
                            color: shapeModel.color,
                            width: shapeModel.width,
                            height: shapeModel.height,
                          ),
                          clipper: shapeModel.shape,
                        ),
                      ),
                      childWhenDragging: Container(),
                      onDragStarted: () {
                        int index = shapeModel.id - 1;

                        String pergunta = listaPerguntas[index];
                        String resposta = listaRespostas[index];

                        List<String> alternativas = [];

                        switch (index) {
                          case 0:
                            for (var i = 0; i < 3; i++) {
                              alternativas.add(listaAlternativas[i]);
                            }
                            break;
                          case 1:
                            for (var i = 3; i < 6; i++) {
                              alternativas.add(listaAlternativas[i]);
                            }
                            break;
                          case 2:
                            for (var i = 6; i < 9; i++) {
                              alternativas.add(listaAlternativas[i]);
                            }
                            break;
                          case 3:
                            for (var i = 9; i < 12; i++) {
                              alternativas.add(listaAlternativas[i]);
                            }
                            break;
                          case 4:
                            for (var i = 12; i < 15; i++) {
                              alternativas.add(listaAlternativas[i]);
                            }
                            break;
                          case 5:
                            for (var i = 15; i < 18; i++) {
                              alternativas.add(listaAlternativas[i]);
                            }
                            break;
                          case 6:
                            for (var i = 18; i < 21; i++) {
                              alternativas.add(listaAlternativas[i]);
                            }
                            break;
                          case 7:
                            for (var i = 21; i < 24; i++) {
                              alternativas.add(listaAlternativas[i]);
                            }
                            break;
                          case 8:
                            for (var i = 24; i < 27; i++) {
                              alternativas.add(listaAlternativas[i]);
                            }
                            break;
                        }

                        switch (shapeModel.id) {
                          case 1:
                            if (shapeModel.firstInteraction) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PerguntaPage(
                                      pergunta, alternativas, resposta),
                                ),
                              ) /*.then((value) {
                                pontuacaoTotal =
                                    (pontuacaoTotal + value[0]).toInt();
                                qtdErrosPerguntas.add(value[1]);
                                if (value[1] > 0) {
                                  perguntasErradas.add(value[2]);
                                }
                              })*/
                                  ;
                              shapeModel.firstInteraction = false;
                            }
                            break;
                          case 2:
                            if (shapeModel.firstInteraction) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PerguntaPage(
                                      pergunta, alternativas, resposta),
                                ),
                              ) /*.then((value) {
                                pontuacaoTotal =
                                    (pontuacaoTotal + value[0]).toInt();
                                qtdErrosPerguntas.add(value[1]);
                                if (value[1] > 0) {
                                  perguntasErradas.add(value[2]);
                                }
                              })*/
                                  ;
                              shapeModel.firstInteraction = false;
                            }
                            break;
                          case 3:
                            if (shapeModel.firstInteraction) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PerguntaPage(
                                      pergunta, alternativas, resposta),
                                ),
                              ) /*.then((value) {
                                pontuacaoTotal =
                                    (pontuacaoTotal + value[0]).toInt();
                                qtdErrosPerguntas.add(value[1]);
                                if (value[1] > 0) {
                                  perguntasErradas.add(value[2]);
                                }
                              })*/
                                  ;
                              shapeModel.firstInteraction = false;
                            }
                            break;
                          case 4:
                            if (shapeModel.firstInteraction) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PerguntaPage(
                                      pergunta, alternativas, resposta),
                                ),
                              ) /*.then((value) {
                                pontuacaoTotal =
                                    (pontuacaoTotal + value[0]).toInt();
                                qtdErrosPerguntas.add(value[1]);
                                if (value[1] > 0) {
                                  perguntasErradas.add(value[2]);
                                }
                              })*/
                                  ;
                              shapeModel.firstInteraction = false;
                            }
                            break;
                          case 5:
                            if (shapeModel.firstInteraction) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PerguntaPage(
                                      pergunta, alternativas, resposta),
                                ),
                              ) /*.then((value) {
                                pontuacaoTotal =
                                    (pontuacaoTotal + value[0]).toInt();
                                qtdErrosPerguntas.add(value[1]);
                                if (value[1] > 0) {
                                  perguntasErradas.add(value[2]);
                                }
                              })*/
                                  ;
                              shapeModel.firstInteraction = false;
                            }
                            break;
                          case 6:
                            if (shapeModel.firstInteraction) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PerguntaPage(
                                      pergunta, alternativas, resposta),
                                ),
                              ) /*.then((value) {
                                pontuacaoTotal =
                                    (pontuacaoTotal + value[0]).toInt();
                                qtdErrosPerguntas.add(value[1]);
                                if (value[1] > 0) {
                                  perguntasErradas.add(value[2]);
                                }
                              })*/
                                  ;
                              shapeModel.firstInteraction = false;
                            }
                            break;
                          case 7:
                            if (shapeModel.firstInteraction) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PerguntaPage(
                                      pergunta, alternativas, resposta),
                                ),
                              ) /*.then((value) {
                                pontuacaoTotal =
                                    (pontuacaoTotal + value[0]).toInt();
                                qtdErrosPerguntas.add(value[1]);
                                if (value[1] > 0) {
                                  perguntasErradas.add(value[2]);
                                }
                              })*/
                                  ;
                              shapeModel.firstInteraction = false;
                            }
                            break;
                          case 8:
                            if (shapeModel.firstInteraction) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PerguntaPage(
                                      pergunta, alternativas, resposta),
                                ),
                              ) /*.then((value) {
                                pontuacaoTotal =
                                    (pontuacaoTotal + value[0]).toInt();
                                qtdErrosPerguntas.add(value[1]);
                                if (value[1] > 0) {
                                  perguntasErradas.add(value[2]);
                                }
                              })*/
                                  ;
                              shapeModel.firstInteraction = false;
                            }
                            break;
                          case 9:
                            if (shapeModel.firstInteraction) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PerguntaPage(
                                      pergunta, alternativas, resposta),
                                ),
                              ) /*.then((value) {
                                pontuacaoTotal =
                                    (pontuacaoTotal + value[0]).toInt();
                                qtdErrosPerguntas.add(value[1]);
                                if (value[1] > 0) {
                                  perguntasErradas.add(value[2]);
                                }
                              })*/
                                  ;
                              shapeModel.firstInteraction = false;
                            }
                            break;
                        }
                      },
                      onDragEnd: (DraggableDetails d) {
                        //Faz mover forma pra cima
                        setState(() {
                          /*widget.shapeModel.position
                        .setPosition(d.offset.dx, d.offset.dy);*/
                        });
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
