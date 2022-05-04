import 'package:flutter/material.dart';
import 'package:technoed/models/tipos_dificuldade.dart';
import 'package:technoed/models/dificuldade.dart';
import 'package:technoed/models/forma.dart';
import 'package:technoed/widgets/interacao_forma.dart';
import 'package:technoed/widgets/interacao_alvo.dart';

class DesafioPage extends StatefulWidget {
  static int shapeCount = 0;

  final List<Forma> dificuldade =
      Dificuldades().levels[TiposDificuldade.nivelAtual].shapes;

  static int shapeOfCount = 0;

  DesafioPage({Key? key}) : super(key: key) {
    shapeOfCount =
        Dificuldades().levels[TiposDificuldade.nivelAtual].shapeOfCount;
    shapeCount = 0;
  }

  @override
  _DesafioPageState createState() => _DesafioPageState();
}

class _DesafioPageState extends State<DesafioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 240, 248),
      body: Center(
        child: Stack(children: [
          ...widget.dificuldade.map((e) => InteracaoAlvo(shapeModel: e)),
          ...widget.dificuldade.map((e) => InteracaoForma(shapeModel: e)),
        ]),
      ),
    );
  }
}
