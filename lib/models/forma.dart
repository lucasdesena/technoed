import 'package:flutter/material.dart';
import 'package:technoed/models/posicao.dart';

class Forma {
  bool isPlaced = false;
  bool firstInteraction = true;
  final int id;
  final double height;
  final double width;
  final Posicao targetPosition;
  final Posicao position;
  final Color color;
  Color targetColor;
  final CustomClipper<Path> shape;
  final double rotationAngle;

  Forma({
    required this.height,
    required this.width,
    required this.id,
    required this.targetPosition,
    required this.position,
    required this.color,
    required this.targetColor,
    required this.shape,
    required this.rotationAngle,
  });
}
