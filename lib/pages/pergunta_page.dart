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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 60.0, 12.0, 12.0),
                child: Center(
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 48, 12, 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 180, 216),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          widget.alternativas[0],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 48, 12, 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 180, 216),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          widget.alternativas[1],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 48, 12, 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 180, 216),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          widget.alternativas[2],
                          style: const TextStyle(fontSize: 20),
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
