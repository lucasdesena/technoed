import 'package:flutter/material.dart';

class PerguntaPage extends StatefulWidget {
  final String pergunta;
  final List<String> alternativas;
  final String resposta;
  const PerguntaPage(this.pergunta, this.alternativas, this.resposta,
      {Key? key})
      : super(key: key);

  @override
  State<PerguntaPage> createState() => _PerguntaPageState();
}

class _PerguntaPageState extends State<PerguntaPage> {
  bool voltar = false;
  int pontos = 0;
  int tentativa = 1;
  int qtdErrosPerguntas = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return voltar;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 202, 240, 248),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 60.0, 12.0, 12.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Pergunta: ' + widget.pergunta,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 48, 20, 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.alternativas[0] == widget.resposta) {
                      switch (tentativa) {
                        case 1:
                          pontos += 4;
                          break;
                        case 2:
                          pontos += 2;
                          break;
                        case 3:
                          pontos += 0;
                          break;
                      }
                      Navigator.pop(context,
                          [pontos, qtdErrosPerguntas, widget.pergunta]);
                    } else {
                      tentativa++;
                      qtdErrosPerguntas++;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 180, 216),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text(
                                widget.alternativas[0],
                                overflow: TextOverflow.clip,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 48, 20, 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.alternativas[1] == widget.resposta) {
                      switch (tentativa) {
                        case 1:
                          pontos += 4;
                          break;
                        case 2:
                          pontos += 2;
                          break;
                        case 3:
                          pontos += 0;
                          break;
                      }
                      Navigator.pop(context,
                          [pontos, qtdErrosPerguntas, widget.pergunta]);
                    } else {
                      tentativa++;
                      qtdErrosPerguntas++;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 180, 216),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Text(
                                widget.alternativas[1],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 48, 20, 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.alternativas[2] == widget.resposta) {
                      switch (tentativa) {
                        case 1:
                          pontos += 4;
                          break;
                        case 2:
                          pontos += 2;
                          break;
                        case 3:
                          pontos += 0;
                          break;
                      }
                      Navigator.pop(context,
                          [pontos, qtdErrosPerguntas, widget.pergunta]);
                    } else {
                      tentativa++;
                      qtdErrosPerguntas++;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 180, 216),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Text(
                                widget.alternativas[2],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
