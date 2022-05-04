import 'package:flutter/material.dart';
import 'package:technoed/models/forma.dart';
import 'package:technoed/pages/desafio_page.dart';

class InteracaoAlvo extends StatefulWidget {
  final Forma shapeModel;
  const InteracaoAlvo({Key? key, required this.shapeModel}) : super(key: key);

  @override
  _InteracaoAlvoState createState() => _InteracaoAlvoState();
}

class _InteracaoAlvoState extends State<InteracaoAlvo> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.shapeModel.targetPosition.x,
      left: widget.shapeModel.targetPosition.y,
      child: DragTarget<Forma>(
        builder: (context, candidateData, rejectedData) => RotationTransition(
          turns: AlwaysStoppedAnimation(widget.shapeModel.rotationAngle),
          child: ClipPath(
            child: Container(
              color: widget.shapeModel.targetColor,
              width: widget.shapeModel.width,
              height: widget.shapeModel.height,
            ),
            clipper: widget.shapeModel.shape,
          ),
        ),
        onWillAccept: (data) {
          print(data);
          return true;
        },
        onAccept: (data) {
          if (data.id == widget.shapeModel.id) {
            setState(() {
              data.isPlaced = true;
              data.targetColor = data.color;
              DesafioPage.shapeCount++;
            });
          }
        },
      ),
    );
  }
}
