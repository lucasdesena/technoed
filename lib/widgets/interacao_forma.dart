import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technoed/models/forma.dart';
import 'package:technoed/pages/pergunta_page.dart';
import 'package:technoed/services/cadastro_service.dart';

class InteracaoForma extends StatefulWidget {
  final String nomeDesafio;
  final Forma shapeModel;
  const InteracaoForma(
    this.nomeDesafio, {
    Key? key,
    required this.shapeModel,
  }) : super(key: key);

  @override
  _InteracaoFormaState createState() => _InteracaoFormaState();
}

class _InteracaoFormaState extends State<InteracaoForma> {
  double pontuacaoTotal = 0;

  @override
  Widget build(BuildContext context) {
    CadastroService cadastro = CadastroService();
    return (widget.shapeModel.isPlaced)
        ? Container()
        : StreamBuilder<QuerySnapshot>(
            stream: cadastro.db.collection('desafios').snapshots(),
            builder: (context, snapshot) {
              return Positioned(
                top: widget.shapeModel.position.y,
                left: widget.shapeModel.position.x,
                child: Draggable(
                  feedback: RotationTransition(
                    turns:
                        AlwaysStoppedAnimation(widget.shapeModel.rotationAngle),
                    child: ClipPath(
                      child: Container(
                        color: widget.shapeModel.color,
                        width: widget.shapeModel.width,
                        height: widget.shapeModel.height,
                      ),
                      clipper: widget.shapeModel.shape,
                    ),
                  ),
                  data: widget.shapeModel,
                  child: RotationTransition(
                    turns:
                        AlwaysStoppedAnimation(widget.shapeModel.rotationAngle),
                    child: ClipPath(
                      child: Container(
                        color: widget.shapeModel.color,
                        width: widget.shapeModel.width,
                        height: widget.shapeModel.height,
                      ),
                      clipper: widget.shapeModel.shape,
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDragStarted: () {
                    int numeroDaPergunta = widget.shapeModel.id - 1;

                    String pergunta = snapshot.data!.docs
                        .where((grupo) => grupo.id == widget.nomeDesafio)
                        .map((doc) => doc['perguntas'][numeroDaPergunta])
                        .single;

                    String resposta = snapshot.data!.docs
                        .where((grupo) => grupo.id == widget.nomeDesafio)
                        .map((doc) => doc['respostas'][numeroDaPergunta])
                        .single;

                    List<String> alternativas = [];

                    switch (numeroDaPergunta) {
                      case 0:
                        for (var i = 0; i < 3; i++) {
                          alternativas.add(snapshot.data!.docs
                              .where((grupo) => grupo.id == widget.nomeDesafio)
                              .map((doc) => doc['alternativas'][i])
                              .single);
                        }
                        break;
                      case 1:
                        for (var i = 3; i < 6; i++) {
                          alternativas.add(snapshot.data!.docs
                              .where((grupo) => grupo.id == widget.nomeDesafio)
                              .map((doc) => doc['alternativas'][i])
                              .single);
                        }
                        break;
                      case 2:
                        for (var i = 6; i < 9; i++) {
                          alternativas.add(snapshot.data!.docs
                              .where((grupo) => grupo.id == widget.nomeDesafio)
                              .map((doc) => doc['alternativas'][i])
                              .single);
                        }
                        break;
                      case 3:
                        for (var i = 9; i < 12; i++) {
                          alternativas.add(snapshot.data!.docs
                              .where((grupo) => grupo.id == widget.nomeDesafio)
                              .map((doc) => doc['alternativas'][i])
                              .single);
                        }
                        break;
                      case 4:
                        for (var i = 12; i < 15; i++) {
                          alternativas.add(snapshot.data!.docs
                              .where((grupo) => grupo.id == widget.nomeDesafio)
                              .map((doc) => doc['alternativas'][i])
                              .single);
                        }
                        break;
                      case 5:
                        for (var i = 15; i < 18; i++) {
                          alternativas.add(snapshot.data!.docs
                              .where((grupo) => grupo.id == widget.nomeDesafio)
                              .map((doc) => doc['alternativas'][i])
                              .single);
                        }
                        break;
                      case 6:
                        for (var i = 18; i < 21; i++) {
                          alternativas.add(snapshot.data!.docs
                              .where((grupo) => grupo.id == widget.nomeDesafio)
                              .map((doc) => doc['alternativas'][i])
                              .single);
                        }
                        break;
                      case 7:
                        for (var i = 21; i < 24; i++) {
                          alternativas.add(snapshot.data!.docs
                              .where((grupo) => grupo.id == widget.nomeDesafio)
                              .map((doc) => doc['alternativas'][i])
                              .single);
                        }
                        break;
                      case 8:
                        for (var i = 24; i < 27; i++) {
                          alternativas.add(snapshot.data!.docs
                              .where((grupo) => grupo.id == widget.nomeDesafio)
                              .map((doc) => doc['alternativas'][i])
                              .single);
                        }
                        break;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PerguntaPage(pergunta, alternativas, resposta),
                      ),
                    ).then((value) {
                      pontuacaoTotal += value;
                    });
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
          );
  }
}
