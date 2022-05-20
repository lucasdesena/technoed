import 'package:flutter/material.dart';
import 'package:technoed/models/dificuldade.dart';
import 'package:technoed/models/forma.dart';
import 'package:technoed/widgets/interacao_forma.dart';
import 'package:technoed/widgets/interacao_alvo.dart';

class DesafioPage extends StatefulWidget {
  final String nomeDesafio;
  final String dificuldade;
  const DesafioPage(this.nomeDesafio, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  _DesafioPageState createState() => _DesafioPageState();
}

class _DesafioPageState extends State<DesafioPage> {
  List<Forma> pecas = Dificuldades().niveis[0].shapes;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.dificuldade == 'Normal') {
        pecas = Dificuldades().niveis[3].shapes;
      } else {
        pecas = Dificuldades().niveis[8].shapes;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 240, 248),
      body: Center(
        child: Stack(children: [
          ...pecas.map((e) => InteracaoAlvo(shapeModel: e)),
          ...pecas.map((e) => InteracaoForma(
                widget.nomeDesafio,
                shapeModel: e,
              )),
        ]),
      ),
    );
  }
}
