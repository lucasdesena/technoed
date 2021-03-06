import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/models/dificuldade.dart';
import 'package:technoed/models/forma.dart';
import 'package:technoed/pages/pergunta_page.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class DesafioPage extends StatefulWidget {
  final String idDesafio;
  final String dificuldade;
  final String emailAluno;
  const DesafioPage(this.idDesafio, this.dificuldade, this.emailAluno,
      {Key? key})
      : super(key: key);

  @override
  _DesafioPageState createState() => _DesafioPageState();
}

class _DesafioPageState extends State<DesafioPage> {
  bool voltar = false;
  List<Forma> pecas = Dificuldades().niveis[0].shapes;
  int shapeOfCount = 0;
  int shapeCount = 0;

  int pontuacaoTotal = 0;
  int qtdErrosTangram = 0;
  int qtdErrosPerguntas = 0;

  List<String> perguntasErradas = [];

  DateTime dataRealizada = DateTime.now();

  CadastroService cadastro = CadastroService();

  int contarSequencia = 0;
  List<String> conquistas = [];
  List<String> conquistasDaConta = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.dificuldade == 'Normal') {
        pecas = Dificuldades().niveis[3].shapes;
        shapeOfCount = Dificuldades().niveis[3].shapeOfCount;
      } else {
        pecas = Dificuldades().niveis[7].shapes;
        shapeOfCount = Dificuldades().niveis[7].shapeOfCount;
      }
    });
    cadastro.acessarDesafio(widget.idDesafio, widget.emailAluno);
  }

  bool tangramFinalizado() {
    if (shapeOfCount == shapeCount) {
      return true;
    }
    return false;
  }

  obterNomeEAdicionarDesafioConcluido(
      String uid,
      String idRelatorio,
      String emailAluno,
      String qtdErrosTangram,
      String qtdErrosPerguntas,
      List<String> perguntasErradas,
      String data) {
    cadastro.obterNome(uid).then((value) {
      String nome = '$emailAluno -' + value;
      cadastro.adicionarDesafioRealizado(idRelatorio, nome, emailAluno,
          qtdErrosTangram, qtdErrosPerguntas, perguntasErradas, data);
    });
  }

  @override
  Widget build(BuildContext context) {
    String uid = context.read<AuthService>().usuario!.uid;
    String email = context.read<AuthService>().usuario!.email.toString();
    return WillPopScope(
      onWillPop: () async {
        return voltar;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromARGB(255, 202, 240, 248),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 60,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'Clique nas pe??as para responder as\nperguntas e use-as para montar a figura',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 143, 146, 148),
                          fontSize: 15),
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        tooltip: 'Sair do Desafio',
                        padding: const EdgeInsets.only(right: 5, bottom: 5),
                        icon: const Icon(
                          MdiIcons.close,
                          color: Colors.red,
                          size: 40,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              actionsAlignment: MainAxisAlignment.center,
                              title: const Text(
                                'Confirma????o',
                                textAlign: TextAlign.center,
                              ),
                              content: const Text(
                                'Se voc?? sair do desafio, n??o receber?? pontos e n??o poder?? realiz??-lo novamente.\n\nDeseja mesmo sair?',
                                textAlign: TextAlign.center,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Sim');
                                  },
                                  child: const Text('Sim'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancelar'),
                                  child: const Text('Cancelar'),
                                ),
                              ],
                            ),
                          ).then((value) {
                            if (value == 'Sim') {
                              Navigator.pop(context);
                            }
                          });
                        }),
                  ),
                ],
              ),
            ),
            ...pecas.map(
              (shapeModel) => StreamBuilder<QuerySnapshot>(
                  stream: cadastro.db.collection('desafios').snapshots(),
                  builder: (context, snapshot) {
                    return Positioned(
                      top: shapeModel.targetPosition.x,
                      left: shapeModel.targetPosition.y,
                      child: DragTarget<Forma>(
                        builder: (context, candidateData, rejectedData) =>
                            RotationTransition(
                          turns:
                              AlwaysStoppedAnimation(shapeModel.rotationAngle),
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
                                  String idRelatorio = snapshot.data!.docs
                                      .where((desafio) =>
                                          desafio.id == widget.idDesafio)
                                      .map((doc) => doc['idRelatorio'])
                                      .single;

                                  String dataFormatada = "$email -" +
                                      DateFormat('dd/MM/yyyy')
                                          .format(dataRealizada);

                                  String errosTangram =
                                      '$email -$qtdErrosTangram';
                                  String errosPerguntas =
                                      '$email -$qtdErrosPerguntas';

                                  obterNomeEAdicionarDesafioConcluido(
                                      uid,
                                      idRelatorio,
                                      email,
                                      errosTangram,
                                      errosPerguntas,
                                      perguntasErradas,
                                      dataFormatada);

                                  if (pontuacaoTotal > 0) {
                                    cadastro.adicionarPontuacao(
                                        uid, pontuacaoTotal);
                                  }
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Lottie.asset(
                                              'assets/images/lottie-star.json',
                                              width: 70,
                                              height: 70),
                                        ],
                                      ),
                                      content: AnimatedTextKit(
                                        animatedTexts: [
                                          ColorizeAnimatedText(
                                            'Parab??ns!\n\nVoc?? ganhou $pontuacaoTotal ponto(s) no desafio!',
                                            colors: [
                                              Colors.black,
                                              const Color.fromARGB(
                                                  255, 0, 180, 216),
                                              const Color.fromARGB(
                                                  255, 231, 235, 6),
                                              const Color.fromARGB(
                                                  255, 6, 236, 56),
                                              const Color.fromARGB(
                                                  255, 48, 6, 236),
                                            ],
                                            speed: const Duration(
                                                milliseconds: 400),
                                            textAlign: TextAlign.center,
                                            textStyle:
                                                const TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Ok'),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  ).then((value) {
                                    if (contarSequencia >= 3) {
                                      conquistas.add("Sem press??o");
                                    }
                                    if (conquistas.isNotEmpty) {
                                      bool jaTemAConquista = false;
                                      cadastro.obterConquistas(uid).then(
                                        (value) {
                                          conquistasDaConta = List.from(value);
                                          for (var conquista
                                              in conquistasDaConta) {
                                            if (conquista == "Sem press??o") {
                                              conquistas.removeWhere(
                                                  (element) =>
                                                      element == "Sem press??o");
                                              jaTemAConquista = true;
                                            }
                                          }
                                          if (jaTemAConquista == true) {
                                            Navigator.pop(context);
                                          } else {
                                            cadastro.adicionarConquista(
                                                uid, conquistas);
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                actionsAlignment:
                                                    MainAxisAlignment.center,
                                                title: Column(
                                                  children: <Widget>[
                                                    Lottie.asset(
                                                        'assets/images/lottie-trophy.json',
                                                        repeat: false,
                                                        width: 70,
                                                        height: 70),
                                                    const Text(
                                                      'Voc?? desbloqueou a conquista "Sem Press??o"!',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                content: Lottie.asset(
                                                    'assets/images/lottie-count.json',
                                                    width: 70,
                                                    height: 70),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'Ok'),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            ).then((value) =>
                                                Navigator.pop(context));
                                          }
                                        },
                                      );
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  });
                                }
                              },
                            );
                          } else {
                            if (pontuacaoTotal > 1) {
                              pontuacaoTotal--;
                            }
                            qtdErrosTangram++;
                            Fluttertoast.showToast(
                              msg: 'Voc?? errou, tente novamente!',
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor:
                                  const Color.fromARGB(255, 245, 81, 81),
                            );
                          }
                        },
                      ),
                    );
                  }),
            ),
            ...pecas.map(
              (shapeModel) => (shapeModel.isPlaced)
                  ? Container()
                  : StreamBuilder<QuerySnapshot>(
                      stream: cadastro.db.collection('desafios').snapshots(),
                      builder: (context, snapshot) {
                        return Positioned(
                          top: shapeModel.position.y,
                          left: shapeModel.position.x,
                          child: Draggable(
                            feedback: RotationTransition(
                              turns: AlwaysStoppedAnimation(
                                  shapeModel.rotationAngle),
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
                              turns: AlwaysStoppedAnimation(
                                  shapeModel.rotationAngle),
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

                              String pergunta = snapshot.data!.docs
                                  .where((desafio) =>
                                      desafio.id == widget.idDesafio)
                                  .map((doc) => doc['perguntas'][index])
                                  .single;

                              String resposta = snapshot.data!.docs
                                  .where((desafio) =>
                                      desafio.id == widget.idDesafio)
                                  .map((doc) => doc['respostas'][index])
                                  .single;

                              List<String> alternativas = [];

                              switch (index) {
                                case 0:
                                  for (var i = 0; i < 3; i++) {
                                    alternativas.add(snapshot.data!.docs
                                        .where((desafio) =>
                                            desafio.id == widget.idDesafio)
                                        .map((doc) => doc['alternativas'][i])
                                        .single);
                                  }
                                  break;
                                case 1:
                                  for (var i = 3; i < 6; i++) {
                                    alternativas.add(snapshot.data!.docs
                                        .where((desafio) =>
                                            desafio.id == widget.idDesafio)
                                        .map((doc) => doc['alternativas'][i])
                                        .single);
                                  }
                                  break;
                                case 2:
                                  for (var i = 6; i < 9; i++) {
                                    alternativas.add(snapshot.data!.docs
                                        .where((desafio) =>
                                            desafio.id == widget.idDesafio)
                                        .map((doc) => doc['alternativas'][i])
                                        .single);
                                  }
                                  break;
                                case 3:
                                  for (var i = 9; i < 12; i++) {
                                    alternativas.add(snapshot.data!.docs
                                        .where((desafio) =>
                                            desafio.id == widget.idDesafio)
                                        .map((doc) => doc['alternativas'][i])
                                        .single);
                                  }
                                  break;
                                case 4:
                                  for (var i = 12; i < 15; i++) {
                                    alternativas.add(snapshot.data!.docs
                                        .where((desafio) =>
                                            desafio.id == widget.idDesafio)
                                        .map((doc) => doc['alternativas'][i])
                                        .single);
                                  }
                                  break;
                                case 5:
                                  for (var i = 15; i < 18; i++) {
                                    alternativas.add(snapshot.data!.docs
                                        .where((desafio) =>
                                            desafio.id == widget.idDesafio)
                                        .map((doc) => doc['alternativas'][i])
                                        .single);
                                  }
                                  break;
                                case 6:
                                  for (var i = 18; i < 21; i++) {
                                    alternativas.add(snapshot.data!.docs
                                        .where((desafio) =>
                                            desafio.id == widget.idDesafio)
                                        .map((doc) => doc['alternativas'][i])
                                        .single);
                                  }
                                  break;
                                case 7:
                                  for (var i = 21; i < 24; i++) {
                                    alternativas.add(snapshot.data!.docs
                                        .where((desafio) =>
                                            desafio.id == widget.idDesafio)
                                        .map((doc) => doc['alternativas'][i])
                                        .single);
                                  }
                                  break;
                                case 8:
                                  for (var i = 24; i < 27; i++) {
                                    alternativas.add(snapshot.data!.docs
                                        .where((desafio) =>
                                            desafio.id == widget.idDesafio)
                                        .map((doc) => doc['alternativas'][i])
                                        .single);
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
                                    ).then((value) {
                                      pontuacaoTotal =
                                          (pontuacaoTotal + value[0]).toInt();
                                      qtdErrosPerguntas =
                                          (qtdErrosPerguntas + value[1])
                                              .toInt();
                                      if (value[1] > 0) {
                                        perguntasErradas
                                            .add('$email -' + value[2]);
                                      }
                                      if (value[3] == true) {
                                        contarSequencia++;
                                      } else if (value[3] == false &&
                                          contarSequencia < 3) {
                                        contarSequencia = 0;
                                      }
                                    });
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
                                    ).then((value) {
                                      pontuacaoTotal =
                                          (pontuacaoTotal + value[0]).toInt();
                                      qtdErrosPerguntas =
                                          (qtdErrosPerguntas + value[1])
                                              .toInt();
                                      if (value[1] > 0) {
                                        perguntasErradas
                                            .add('$email -' + value[2]);
                                      }
                                      if (value[3] == true) {
                                        contarSequencia++;
                                      } else if (value[3] == false &&
                                          contarSequencia < 3) {
                                        contarSequencia = 0;
                                      }
                                    });
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
                                    ).then((value) {
                                      pontuacaoTotal =
                                          (pontuacaoTotal + value[0]).toInt();
                                      qtdErrosPerguntas =
                                          (qtdErrosPerguntas + value[1])
                                              .toInt();
                                      if (value[1] > 0) {
                                        perguntasErradas
                                            .add('$email -' + value[2]);
                                      }
                                      if (value[3] == true) {
                                        contarSequencia++;
                                      } else if (value[3] == false &&
                                          contarSequencia < 3) {
                                        contarSequencia = 0;
                                      }
                                    });
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
                                    ).then((value) {
                                      pontuacaoTotal =
                                          (pontuacaoTotal + value[0]).toInt();
                                      qtdErrosPerguntas =
                                          (qtdErrosPerguntas + value[1])
                                              .toInt();
                                      if (value[1] > 0) {
                                        perguntasErradas
                                            .add('$email -' + value[2]);
                                      }
                                      if (value[3] == true) {
                                        contarSequencia++;
                                      } else if (value[3] == false &&
                                          contarSequencia < 3) {
                                        contarSequencia = 0;
                                      }
                                    });
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
                                    ).then((value) {
                                      pontuacaoTotal =
                                          (pontuacaoTotal + value[0]).toInt();
                                      qtdErrosPerguntas =
                                          (qtdErrosPerguntas + value[1])
                                              .toInt();
                                      if (value[1] > 0) {
                                        perguntasErradas
                                            .add('$email -' + value[2]);
                                      }
                                      if (value[3] == true) {
                                        contarSequencia++;
                                      } else if (value[3] == false &&
                                          contarSequencia < 3) {
                                        contarSequencia = 0;
                                      }
                                    });
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
                                    ).then((value) {
                                      pontuacaoTotal =
                                          (pontuacaoTotal + value[0]).toInt();
                                      qtdErrosPerguntas =
                                          (qtdErrosPerguntas + value[1])
                                              .toInt();
                                      if (value[1] > 0) {
                                        perguntasErradas
                                            .add('$email -' + value[2]);
                                      }
                                      if (value[3] == true) {
                                        contarSequencia++;
                                      } else if (value[3] == false &&
                                          contarSequencia < 3) {
                                        contarSequencia = 0;
                                      }
                                    });
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
                                    ).then((value) {
                                      pontuacaoTotal =
                                          (pontuacaoTotal + value[0]).toInt();
                                      qtdErrosPerguntas =
                                          (qtdErrosPerguntas + value[1])
                                              .toInt();
                                      if (value[1] > 0) {
                                        perguntasErradas
                                            .add('$email -' + value[2]);
                                      }
                                      if (value[3] == true) {
                                        contarSequencia++;
                                      } else if (value[3] == false &&
                                          contarSequencia < 3) {
                                        contarSequencia = 0;
                                      }
                                    });
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
                                    ).then((value) {
                                      pontuacaoTotal =
                                          (pontuacaoTotal + value[0]).toInt();
                                      qtdErrosPerguntas =
                                          (qtdErrosPerguntas + value[1])
                                              .toInt();
                                      if (value[1] > 0) {
                                        perguntasErradas
                                            .add('$email -' + value[2]);
                                      }
                                      if (value[3] == true) {
                                        contarSequencia++;
                                      } else if (value[3] == false &&
                                          contarSequencia < 3) {
                                        contarSequencia = 0;
                                      }
                                    });
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
                                    ).then((value) {
                                      pontuacaoTotal =
                                          (pontuacaoTotal + value[0]).toInt();
                                      qtdErrosPerguntas =
                                          (qtdErrosPerguntas + value[1])
                                              .toInt();
                                      if (value[1] > 0) {
                                        perguntasErradas
                                            .add('$email -' + value[2]);
                                      }
                                      if (value[3] == true) {
                                        contarSequencia++;
                                      } else if (value[3] == false &&
                                          contarSequencia < 3) {
                                        contarSequencia = 0;
                                      }
                                    });
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
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
