import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoed/models/dificuldade.dart';
import 'package:technoed/models/forma.dart';
import 'package:technoed/pages/pergunta_page.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class DesafioPage extends StatefulWidget {
  final String nomeDesafio;
  final String dificuldade;
  final String emailAluno;
  const DesafioPage(this.nomeDesafio, this.dificuldade, this.emailAluno,
      {Key? key})
      : super(key: key);

  @override
  _DesafioPageState createState() => _DesafioPageState();
}

class _DesafioPageState extends State<DesafioPage> {
  List<Forma> pecas = Dificuldades().niveis[0].shapes;
  int shapeOfCount = 0;
  int shapeCount = 0;
  int pontuacaoTotal = 0;

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
  }

  bool tangramFinalizado() {
    if (shapeOfCount == shapeCount) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    CadastroService cadastro = CadastroService();
    String uid = context.read<AuthService>().usuario!.uid;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 240, 248),
      body: Stack(
        children: <Widget>[
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
                        print(data);
                        return true;
                      },
                      onAccept: (data) {
                        if (data.id == shapeModel.id) {
                          setState(() {
                            data.isPlaced = true;
                            data.targetColor = data.color;
                            shapeCount++;
                            if (tangramFinalizado()) {
                              print('Tangram feito');
                              /*cadastro.concluirDesafio(
                                  widget.nomeDesafio, widget.emailAluno);
                                  
                              List<String> listaEmails = List<String>.from(
                                  snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
                                      .map((doc) => doc['emails'])
                                      .single);
                              if (listaEmails.isEmpty) {
                                cadastro.excluirDesafio(
                                    widget.nomeDesafio, listaEmails);
                              }
                              Navigator.pop(context);
                              */
                              if (pontuacaoTotal > 0) {
                                cadastro.adicionarPontuacao(
                                    uid, pontuacaoTotal);
                              }
                            }
                          });
                        } else {
                          pontuacaoTotal -= 1;
                          print(pontuacaoTotal);
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
                            int numeroDaPergunta = shapeModel.id - 1;

                            String pergunta = snapshot.data!.docs
                                .where(
                                    (grupo) => grupo.id == widget.nomeDesafio)
                                .map(
                                    (doc) => doc['perguntas'][numeroDaPergunta])
                                .single;

                            String resposta = snapshot.data!.docs
                                .where(
                                    (grupo) => grupo.id == widget.nomeDesafio)
                                .map(
                                    (doc) => doc['respostas'][numeroDaPergunta])
                                .single;

                            List<String> alternativas = [];

                            switch (numeroDaPergunta) {
                              case 0:
                                for (var i = 0; i < 3; i++) {
                                  alternativas.add(snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
                                      .map((doc) => doc['alternativas'][i])
                                      .single);
                                }
                                break;
                              case 1:
                                for (var i = 3; i < 6; i++) {
                                  alternativas.add(snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
                                      .map((doc) => doc['alternativas'][i])
                                      .single);
                                }
                                break;
                              case 2:
                                for (var i = 6; i < 9; i++) {
                                  alternativas.add(snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
                                      .map((doc) => doc['alternativas'][i])
                                      .single);
                                }
                                break;
                              case 3:
                                for (var i = 9; i < 12; i++) {
                                  alternativas.add(snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
                                      .map((doc) => doc['alternativas'][i])
                                      .single);
                                }
                                break;
                              case 4:
                                for (var i = 12; i < 15; i++) {
                                  alternativas.add(snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
                                      .map((doc) => doc['alternativas'][i])
                                      .single);
                                }
                                break;
                              case 5:
                                for (var i = 15; i < 18; i++) {
                                  alternativas.add(snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
                                      .map((doc) => doc['alternativas'][i])
                                      .single);
                                }
                                break;
                              case 6:
                                for (var i = 18; i < 21; i++) {
                                  alternativas.add(snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
                                      .map((doc) => doc['alternativas'][i])
                                      .single);
                                }
                                break;
                              case 7:
                                for (var i = 21; i < 24; i++) {
                                  alternativas.add(snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
                                      .map((doc) => doc['alternativas'][i])
                                      .single);
                                }
                                break;
                              case 8:
                                for (var i = 24; i < 27; i++) {
                                  alternativas.add(snapshot.data!.docs
                                      .where((grupo) =>
                                          grupo.id == widget.nomeDesafio)
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
                                        (pontuacaoTotal + value).toInt();
                                    print(value);
                                    print(pontuacaoTotal);
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
                                        (pontuacaoTotal + value).toInt();
                                    print(value);
                                    print(pontuacaoTotal);
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
                                        (pontuacaoTotal + value).toInt();
                                    print(value);
                                    print(pontuacaoTotal);
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
                                        (pontuacaoTotal + value).toInt();
                                    print(value);
                                    print(pontuacaoTotal);
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
                                        (pontuacaoTotal + value).toInt();
                                    print(value);
                                    print(pontuacaoTotal);
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
                                    //Pontuação esta sendo para cada peça
                                    pontuacaoTotal =
                                        (pontuacaoTotal + value).toInt();
                                    print(value);
                                    print(pontuacaoTotal);
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
                                        (pontuacaoTotal + value).toInt();
                                    print(value);
                                    print(pontuacaoTotal);
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
                                        (pontuacaoTotal + value).toInt();
                                    print(value);
                                    print(pontuacaoTotal);
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
                                        (pontuacaoTotal + value).toInt();
                                    print(value);
                                    print(pontuacaoTotal);
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
    );
  }
}
