import 'package:flutter/material.dart';
import 'package:technoed/pages/definir_titulo_page.dart';

class EscolherDesafioPage extends StatefulWidget {
  const EscolherDesafioPage({Key? key}) : super(key: key);

  @override
  State<EscolherDesafioPage> createState() => _EscolherDesafioState();
}

class _EscolherDesafioState extends State<EscolherDesafioPage> {
  String dificuldade = '';

  telaDefinirTitulo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DefinirTituloPage(dificuldade),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              leading: const BackButton(color: Colors.white),
              toolbarHeight: 100,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Novo desafio',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Escolha a dificuldade do desafio',
                    style: TextStyle(
                        color: Color.fromARGB(255, 208, 211, 214),
                        fontSize: 15),
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
                            telaDefinirTitulo();
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
                'Tangram com 7 pe??as e 7 perguntas',
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 143, 146, 148)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
              child: Text(
                'Dif??cil',
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
                            dificuldade = 'Dif??cil';
                            telaDefinirTitulo();
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
                                'Dif??cil',
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
                'Tangram com 9 pe??as e 9 perguntas',
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 143, 146, 148)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
