import 'package:flutter/material.dart';
import 'package:technoed/models/dificuldade.dart';
import 'package:technoed/models/forma.dart';

class TesteTangramPage extends StatefulWidget {
  const TesteTangramPage({Key? key}) : super(key: key);

  @override
  _TesteTangramPageState createState() => _TesteTangramPageState();
}

class _TesteTangramPageState extends State<TesteTangramPage> {
  List<Forma> pecas = Dificuldades().niveis[0].shapes;
  int shapeOfCount = 0;
  int shapeCount = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      pecas = Dificuldades().niveis[3].shapes;
      shapeOfCount = Dificuldades().niveis[3].shapeOfCount;
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
                    'Clique nas peças e use-as para \nmontar a figura',
                    textAlign: TextAlign.left,
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
                    setState(() {
                      data.isPlaced = true;
                      data.targetColor = data.color;
                      shapeCount++;
                    });
                  } else {
                    print("errou");
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
