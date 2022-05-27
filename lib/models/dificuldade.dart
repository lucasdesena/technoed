import 'package:flutter/material.dart';
import 'package:technoed/models/tipos_dificuldade.dart';
import 'package:technoed/models/posicao.dart';
import 'package:technoed/models/forma.dart';
import 'package:technoed/models/tipos_forma.dart';

class Dificuldades {
  final niveis = [
    //Desafio 0
    TiposDificuldade([
      Forma(
        id: 1,
        height: 80,
        width: 160,
        targetPosition: Posicao(145, 2),
        position: Posicao(50, 400),
        color: Colors.yellow,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 225 / 360,
      ),
      Forma(
        id: 2,
        height: 30,
        width: 110,
        targetPosition: Posicao(93, 27),
        position: Posicao(50, 400),
        color: Colors.pink,
        targetColor: Colors.grey,
        shape: Paralelograma(flip: true),
        rotationAngle: 45 / 360,
      ),
      Forma(
        id: 3,
        height: 42,
        width: 85,
        targetPosition: Posicao(148, 109),
        position: Posicao(50, 400),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 45 / 360,
      ),
      Forma(
        id: 4,
        height: 80,
        width: 160,
        targetPosition: Posicao(75, 110),
        position: Posicao(50, 400),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 5,
        height: 60,
        width: 60,
        targetPosition: Posicao(154, 210.7),
        position: Posicao(50, 400),
        color: Colors.purple,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 6,
        height: 42,
        width: 85,
        targetPosition: Posicao(178, 269.5),
        position: Posicao(50, 400),
        color: Colors.orange,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 135 / 360,
      ),
      Forma(
        id: 7,
        height: 57,
        width: 110,
        targetPosition: Posicao(127.5, 244),
        position: Posicao(50, 400),
        color: Colors.green,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 90 / 360,
      ),
    ], 7),
    //Desafio 1
    TiposDificuldade([
      Forma(
        id: 1,
        height: 30,
        width: 110,
        targetPosition: Posicao(168.5, 19),
        position: Posicao(50, 400),
        color: Colors.green,
        targetColor: Colors.grey,
        shape: Paralelograma(flip: false),
        rotationAngle: 45 / 360,
      ),
      Forma(
        id: 2,
        height: 80,
        width: 160,
        targetPosition: Posicao(200, 141.5),
        position: Posicao(50, 400),
        color: Colors.pink,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 315 / 360,
      ),
      Forma(
        id: 3,
        height: 80,
        width: 160,
        targetPosition: Posicao(200, 85.5),
        position: Posicao(50, 400),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 45 / 360,
      ),
      Forma(
        id: 4,
        height: 42,
        width: 85,
        targetPosition: Posicao(318, 137),
        position: Posicao(50, 400),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 225 / 360,
      ),
      Forma(
        id: 5,
        height: 25,
        width: 50,
        targetPosition: Posicao(300, 192.5),
        position: Posicao(50, 400),
        color: Colors.purple,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 6,
        height: 60,
        width: 60,
        targetPosition: Posicao(151.8, 246),
        position: Posicao(50, 400),
        color: Colors.orange,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 7,
        height: 42,
        width: 85,
        targetPosition: Posicao(110, 246),
        position: Posicao(50, 400),
        color: Colors.yellow,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 0 / 360,
      ),
    ], 7),
    //Desafio 2
    TiposDificuldade([
      Forma(
        id: 1,
        height: 42,
        width: 85,
        targetPosition: Posicao(50, 137),
        position: Posicao(50, 400),
        color: Colors.orange,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 2,
        height: 60,
        width: 60,
        targetPosition: Posicao(92, 149.5),
        position: Posicao(50, 400),
        color: Colors.green,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 3,
        height: 80,
        width: 160,
        targetPosition: Posicao(150, 30),
        position: Posicao(50, 400),
        color: Colors.purple,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 270 / 360,
      ),
      Forma(
        id: 4,
        height: 30,
        width: 110,
        targetPosition: Posicao(200, 109.5),
        position: Posicao(50, 400),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Paralelograma(flip: true),
        rotationAngle: 90 / 360,
      ),
      Forma(
        id: 5,
        height: 80,
        width: 160,
        targetPosition: Posicao(265.5, 50),
        position: Posicao(50, 400),
        color: Colors.pink,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 225 / 360,
      ),
      Forma(
        id: 6,
        height: 35,
        width: 70,
        targetPosition: Posicao(351, 80),
        position: Posicao(50, 400),
        color: Colors.yellow,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 270 / 360,
      ),
      Forma(
        id: 7,
        height: 35,
        width: 70,
        targetPosition: Posicao(351, 150),
        position: Posicao(50, 400),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 270 / 360,
      ),
    ], 7),
    //Desafio 3
    //targetPosition ajustado em +80 na posição X para ficar abaixo do appbar
    //position ajustado em +50 na posição Y para distanciar do targetPosition
    TiposDificuldade([
      Forma(
        id: 1,
        height: 42,
        width: 85,
        targetPosition: Posicao(134, 62),
        position: Posicao(110, 450),
        color: Colors.pink,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 2,
        height: 60,
        width: 60,
        targetPosition: Posicao(175, 87),
        position: Posicao(100, 450),
        color: Colors.green,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 3,
        height: 80,
        width: 160,
        targetPosition: Posicao(223, 91.7),
        position: Posicao(100, 450),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 45 / 360,
      ),
      Forma(
        id: 4,
        height: 42,
        width: 85,
        targetPosition: Posicao(305, 114.6),
        position: Posicao(100, 450),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 5,
        height: 80,
        width: 160,
        targetPosition: Posicao(185, 148),
        position: Posicao(100, 450),
        color: Colors.orange,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 6,
        height: 30,
        width: 110,
        targetPosition: Posicao(230, 230),
        position: Posicao(100, 450),
        color: Colors.yellow,
        targetColor: Colors.grey,
        shape: Paralelograma(flip: false),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 7,
        height: 50,
        width: 100,
        targetPosition: Posicao(156.3, 245.4),
        position: Posicao(100, 450),
        color: Colors.purple,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 135 / 360,
      ),
    ], 7),
    //Desafio 4
    TiposDificuldade([
      Forma(
        id: 1,
        height: 42,
        width: 85,
        targetPosition: Posicao(57, 16.5),
        position: Posicao(50, 400),
        color: Colors.pink,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 90 / 360,
      ),
      Forma(
        id: 2,
        height: 42,
        width: 85,
        targetPosition: Posicao(57, 58.5),
        position: Posicao(50, 400),
        color: Colors.orange,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 270 / 360,
      ),
      Forma(
        id: 3,
        height: 60,
        width: 60,
        targetPosition: Posicao(90, 50),
        position: Posicao(50, 400),
        color: Colors.green,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 45 / 360,
      ),
      Forma(
        id: 4,
        height: 60,
        width: 120,
        targetPosition: Posicao(120, 62),
        position: Posicao(50, 400),
        color: Colors.yellow,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 5,
        height: 80,
        width: 160,
        targetPosition: Posicao(168, 13.5),
        position: Posicao(50, 400),
        color: Colors.purple,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 6,
        height: 80,
        width: 160,
        targetPosition: Posicao(224, 70),
        position: Posicao(50, 400),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 135 / 360,
      ),
      Forma(
        id: 7,
        height: 30,
        width: 110,
        targetPosition: Posicao(263, 177),
        position: Posicao(50, 400),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Paralelograma(flip: false),
        rotationAngle: 0 / 360,
      ),
    ], 7),
    //Desafio 5
    TiposDificuldade([
      Forma(
        id: 1,
        height: 50,
        width: 50,
        targetPosition: Posicao(53, 150),
        position: Posicao(50, 400),
        color: Colors.pink,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 25 / 360,
      ),
      Forma(
        id: 2,
        height: 80,
        width: 160,
        targetPosition: Posicao(100, 70),
        position: Posicao(50, 400),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 3,
        height: 30,
        width: 110,
        targetPosition: Posicao(146, 39),
        position: Posicao(50, 400),
        color: Colors.green,
        targetColor: Colors.grey,
        shape: Paralelograma(flip: false),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 4,
        height: 80,
        width: 160,
        targetPosition: Posicao(197, 85),
        position: Posicao(50, 400),
        color: Colors.yellow,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 135 / 360,
      ),
      Forma(
        id: 5,
        height: 60,
        width: 120,
        targetPosition: Posicao(240, 163),
        position: Posicao(50, 400),
        color: Colors.purple,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 90 / 360,
      ),
      Forma(
        id: 6,
        height: 30,
        width: 60,
        targetPosition: Posicao(261, 19),
        position: Posicao(50, 400),
        color: Colors.orange,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 7,
        height: 30,
        width: 60,
        targetPosition: Posicao(315, 148),
        position: Posicao(50, 400),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 270 / 360,
      ),
    ], 7),
    //Desafio 6
    TiposDificuldade([
      Forma(
        id: 1,
        height: 80,
        width: 160,
        targetPosition: Posicao(50, 15),
        position: Posicao(50, 400),
        color: Colors.green,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 2,
        height: 40,
        width: 80,
        targetPosition: Posicao(120, 89),
        position: Posicao(50, 400),
        color: Colors.orange,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 135 / 360,
      ),
      Forma(
        id: 3,
        height: 80,
        width: 160,
        targetPosition: Posicao(199, 36),
        position: Posicao(50, 400),
        color: Colors.yellow,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -135 / 360,
      ),
      Forma(
        id: 4,
        height: 60,
        width: 120,
        targetPosition: Posicao(258, 34),
        position: Posicao(50, 400),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 5,
        height: 30,
        width: 110,
        targetPosition: Posicao(280, 95),
        position: Posicao(50, 400),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Paralelograma(flip: true),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 6,
        height: 50,
        width: 50,
        targetPosition: Posicao(322, 102),
        position: Posicao(50, 400),
        color: Colors.pink,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 7,
        height: 40,
        width: 80,
        targetPosition: Posicao(394, 76),
        position: Posicao(50, 400),
        color: Colors.purple,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -135 / 360,
      ),
    ], 7),
    //Desafio 7
    //targetPosition ajustado em +80 na posição X para ficar abaixo do appbar
    //position ajustado em +50 na posição Y para distanciar do targetPosition
    TiposDificuldade([
      Forma(
        id: 1,
        height: 80,
        width: 160,
        targetPosition: Posicao(130, 0),
        position: Posicao(100, 450),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 2,
        height: 30,
        width: 60,
        targetPosition: Posicao(158, 124),
        position: Posicao(160, 450),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 135 / 360,
      ),
      Forma(
        id: 3,
        height: 80,
        width: 160,
        targetPosition: Posicao(130, 215),
        position: Posicao(100, 450),
        color: Colors.orange,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 45 / 360,
      ),
      Forma(
        id: 4,
        height: 30,
        width: 60,
        targetPosition: Posicao(158, 192),
        position: Posicao(160, 450),
        color: Colors.yellow,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -135 / 360,
      ),
      Forma(
        id: 5,
        height: 50,
        width: 50,
        targetPosition: Posicao(141.7, 162),
        position: Posicao(160, 450),
        color: Colors.green,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 6,
        height: 50,
        width: 50,
        targetPosition: Posicao(191, 162),
        position: Posicao(160, 450),
        color: Colors.pink,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 7,
        height: 50,
        width: 50,
        targetPosition: Posicao(240, 162),
        position: Posicao(160, 450),
        color: Colors.purple,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 8,
        height: 50,
        width: 50,
        targetPosition: Posicao(289, 162),
        position: Posicao(160, 450),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
      Forma(
        id: 9,
        height: 50,
        width: 50,
        targetPosition: Posicao(338, 162),
        position: Posicao(160, 450),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: 0 / 360,
      ),
    ], 9),
    //Desafio 8
    TiposDificuldade([
      Forma(
        id: 1,
        height: 50,
        width: 50,
        targetPosition: Posicao(101, 250),
        position: Posicao(50, 400),
        color: Colors.orange,
        targetColor: Colors.grey,
        shape: Quadrado(),
        rotationAngle: -25 / 360,
      ),
      Forma(
        id: 2,
        height: 80,
        width: 160,
        targetPosition: Posicao(160, 150),
        position: Posicao(50, 400),
        color: Colors.green,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -180 / 360,
      ),
      Forma(
        id: 3,
        height: 100,
        width: 200,
        targetPosition: Posicao(75, 8),
        position: Posicao(50, 400),
        color: Colors.blue,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -70 / 360,
      ),
      Forma(
        id: 4,
        height: 30,
        width: 110,
        targetPosition: Posicao(230, 190),
        position: Posicao(50, 400),
        color: Colors.yellow,
        targetColor: Colors.grey,
        shape: Paralelograma(flip: false),
        rotationAngle: -45 / 360,
      ),
      Forma(
        id: 5,
        height: 40,
        width: 80,
        targetPosition: Posicao(288, 190),
        position: Posicao(50, 400),
        color: Colors.red,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: 135 / 360,
      ),
      Forma(
        id: 6,
        height: 40,
        width: 80,
        targetPosition: Posicao(258, 253),
        position: Posicao(50, 400),
        color: Colors.purple,
        targetColor: Colors.grey,
        shape: Triangulo(),
        rotationAngle: -270 / 360,
      ),
    ], 6),
  ];
}
