import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technoed/models/forma.dart';
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
                    print(snapshot.data!.docs
                        .where((grupo) => grupo.id == widget.nomeDesafio)
                        .map(
                            (doc) => doc['perguntas'][widget.shapeModel.id - 1])
                        .single);
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
            });
  }
}
