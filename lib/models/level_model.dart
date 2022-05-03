import 'package:technoed/models/shape_model.dart';

class LevelModel {
  final List<ShapeModel> shapes;
  static int currentLevel = 0;
  int shapeOfCount;
  LevelModel(this.shapes, this.shapeOfCount);
}
