import 'package:flutter/material.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  ImageProvider imagem = const AssetImage('assets/images/logo.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            leading: const BackButton(color: Colors.white),
            toolbarHeight: 100,
            title: SizedBox(
              height: 70,
              child: Image(image: imagem),
            ),
            centerTitle: true,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 5.0),
            child: Text(
              'Sobre o aplicativo',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 143, 146, 148)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
                child: const Text(
                  "O aplicativo Technoed foi desenvolvido pelos alunos Lucas de Sena e Marco Antonio Silva no Trabalho de Conclusão de Curso.\n\n"
                  "A função principal da aplicação é auxiliar os professores e alunos a desenvolver o processo de ensino e aprendizagem de maneira interativa, com a realização de desafios com Tangram e perguntas.\n\n"
                  "A aplicação permite ao professor criar grupos de alunos, com base na sua disciplina ou curso. Ele deve criar desafios com figuras do Tangram, sendo que para usar cada peça geométrica, é necessário ao aluno responder uma pergunta.\n\n"
                  "Ao professor ainda são disponibilizados relatórios de desempenho dos grupos.\n\n"
                  "O aluno recebe pontuação a cada desafio, a depender da sua performance nas respostas e pode obter conquistas e ícones (elos) de jogo.\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}