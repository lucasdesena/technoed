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
  bool cliqueAltErrada1 = false;
  bool cliqueAltErrada2 = false;
  bool cliqueAltErrada3 = false;
  bool acertou = false;

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
              cliqueAltErrada1 == false
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 48, 20, 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (widget.alternativas[0] == widget.resposta) {
                            switch (tentativa) {
                              case 1:
                                pontos += 4;
                                acertou = true;
                                break;
                              case 2:
                                pontos += 2;
                                break;
                              case 3:
                                pontos += 0;
                                break;
                              default:
                                pontos += 0;
                                break;
                            }
                            Navigator.pop(context, [
                              pontos,
                              qtdErrosPerguntas,
                              widget.pergunta,
                              acertou
                            ]);
                          } else {
                            setState(() {
                              cliqueAltErrada1 = true;
                            });

                            tentativa++;
                            if (cliqueAltErrada1 == true) {
                              qtdErrosPerguntas = 1;
                            }
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
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20, 48, 20, 0.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
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
              cliqueAltErrada2 == false
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 48, 20, 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (widget.alternativas[1] == widget.resposta) {
                            switch (tentativa) {
                              case 1:
                                pontos += 4;
                                acertou = true;
                                break;
                              case 2:
                                pontos += 2;
                                break;
                              case 3:
                                pontos += 0;
                                break;
                              default:
                                pontos += 0;
                                break;
                            }
                            Navigator.pop(context, [
                              pontos,
                              qtdErrosPerguntas,
                              widget.pergunta,
                              acertou
                            ]);
                          } else {
                            setState(() {
                              cliqueAltErrada2 = true;
                            });
                            tentativa++;
                            if (cliqueAltErrada2 == true) {
                              qtdErrosPerguntas = 1;
                            }
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
                                      widget.alternativas[1],
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
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20, 48, 20, 0.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
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
                                      widget.alternativas[1],
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
              cliqueAltErrada3 == false
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 48, 20, 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (widget.alternativas[2] == widget.resposta) {
                            switch (tentativa) {
                              case 1:
                                pontos += 4;
                                acertou = true;
                                break;
                              case 2:
                                pontos += 2;
                                break;
                              case 3:
                                pontos += 0;
                                break;
                              default:
                                pontos += 0;
                                break;
                            }
                            Navigator.pop(context, [
                              pontos,
                              qtdErrosPerguntas,
                              widget.pergunta,
                              acertou
                            ]);
                          } else {
                            setState(() {
                              cliqueAltErrada3 = true;
                            });
                            tentativa++;
                            if (cliqueAltErrada3 == true) {
                              qtdErrosPerguntas = 1;
                            }
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
                                      widget.alternativas[2],
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
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20, 48, 20, 0.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
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
                                      widget.alternativas[2],
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
            ],
          ),
        ),
      ),
    );
  }
}
