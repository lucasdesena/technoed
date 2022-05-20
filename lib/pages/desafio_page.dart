import 'package:flutter/material.dart';
import 'package:technoed/models/tipos_dificuldade.dart';
import 'package:technoed/models/dificuldade.dart';
import 'package:technoed/models/forma.dart';
import 'package:technoed/widgets/interacao_forma.dart';
import 'package:technoed/widgets/interacao_alvo.dart';

class DesafioPage extends StatefulWidget {
  final String nomeDesafio;
  final List<Forma> dificuldade =
      Dificuldades().niveis[TiposDificuldade.tangram].shapes;

  DesafioPage(this.nomeDesafio, {Key? key}) : super(key: key);

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
          ...widget.dificuldade.map((e) => InteracaoForma(
                widget.nomeDesafio,
                shapeModel: e,
              )),
        ]),
      ),
    );
  }
}
