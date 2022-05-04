import 'package:flutter/material.dart';
import 'package:technoed/pages/criar_desafio_page.dart';

class EscolhaDesafioPage extends StatefulWidget {
  const EscolhaDesafioPage({Key? key}) : super(key: key);

  @override
  State<EscolhaDesafioPage> createState() => _EscolhaDesafioState();
}

class _EscolhaDesafioState extends State<EscolhaDesafioPage> {
  String dificuldade = '';

  telaCriarDesafio() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CriarDesafioPage(dificuldade),
      ),
    );
  }

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
              children: const [
                Text(
                  'Desafio',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Escolha a dificuldade do Tangram',
                  style: TextStyle(
                      color: Color.fromARGB(255, 208, 211, 214), fontSize: 15),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
            child: Text(
              'Normal',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          dificuldade = 'Normal';
                          telaCriarDesafio();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 202, 240, 248),
                          elevation: 6,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.star_half,
                              color: Color.fromARGB(255, 143, 146, 148),
                              size: 60,
                            ),
                            Text(
                              'Normal',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 143, 146, 148)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Text(
              'Descrição: Tangram com 7 peças e 7 perguntas.',
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 143, 146, 148)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
            child: Text(
              'Difícil',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          dificuldade = 'Dificil';
                          telaCriarDesafio();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 202, 240, 248),
                          elevation: 6,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.star_outlined,
                              color: Color.fromARGB(255, 143, 146, 148),
                              size: 60,
                            ),
                            Text(
                              'Difícil',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 143, 146, 148)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Text(
              'Descrição: Tangram com 9 peças e 7 perguntas.',
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 143, 146, 148)),
            ),
          ),
        ],
      ),
    );
  }
}
