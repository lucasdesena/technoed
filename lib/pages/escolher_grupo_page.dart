import 'package:flutter/material.dart';
import 'package:technoed/widgets/lista_escolher_grupo.dart';

class EscolherGrupoPage extends StatefulWidget {
  final String dificuldade;
  final List<String> listaPerguntas;
  final List<String> listaAlternativas;
  const EscolherGrupoPage(
      this.dificuldade, this.listaPerguntas, this.listaAlternativas,
      {Key? key})
      : super(key: key);

  @override
  State<EscolherGrupoPage> createState() => _EscolherGrupoPageState();
}

class _EscolherGrupoPageState extends State<EscolherGrupoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            leading: const BackButton(color: Colors.white),
            toolbarHeight: 100,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Grupo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Escolha o grupo para aplicar o desafio',
                  style: TextStyle(
                      color: Color.fromARGB(255, 208, 211, 214), fontSize: 15),
                ),
              ],
            ),
          ),
          const Expanded(child: ListaEscolherGrupo()),
        ],
      ),
    );
  }
}
