import 'package:flutter/material.dart';
import 'package:technoed/models/level_model.dart';
import 'package:technoed/models/levels.dart';
import 'package:technoed/models/shape_model.dart';
import 'package:technoed/widgets/shape_widget.dart';
import 'package:technoed/widgets/target_widget.dart';

class TestePage extends StatefulWidget {
  static int shapeCount = 0;

  final List<ShapeModel> level =
      Levels().levels[LevelModel.currentLevel].shapes;

  static int shapeOfCount = 0;

  TestePage() {
    shapeOfCount = Levels().levels[LevelModel.currentLevel].shapeOfCount;
    shapeCount = 0;
  }

  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        ...widget.level.map((e) => TargetWidget(shapeModel: e)),
        ...widget.level.map((e) => ShapeWidget(shapeModel: e)),
      ]),
    );
  }
}
