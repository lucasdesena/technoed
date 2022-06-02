import 'package:flutter/material.dart';
import 'package:technoed/pages/criar_grupo_page.dart';
import 'package:technoed/pages/ver_grupo_page.dart';

class GerenciarGruposPage extends StatefulWidget {
  const GerenciarGruposPage({Key? key}) : super(key: key);

  @override
  State<GerenciarGruposPage> createState() => _GerenciarGruposState();
}

class _GerenciarGruposState extends State<GerenciarGruposPage> {
  _telaCriarGrupo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CriarGrupoPage(),
      ),
    );
  }

  _telaVerGrupo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const VerGrupoPage(),
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
              children: const <Widget>[
                Text(
                  'Grupos',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Crie e veja os grupos de alunos',
                  style: TextStyle(
                      color: Color.fromARGB(255, 208, 211, 214), fontSize: 15),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
            child: Text(
              'Criar',
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
                        onPressed: _telaCriarGrupo,
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 202, 240, 248),
                          elevation: 6,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.create_new_folder_outlined,
                              color: Color.fromARGB(255, 143, 146, 148),
                              size: 60,
                            ),
                            Text(
                              'Novo grupo',
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
            padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
            child: Text(
              'Ver',
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
                        onPressed: _telaVerGrupo,
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 202, 240, 248),
                          elevation: 6,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.folder_open,
                              color: Color.fromARGB(255, 143, 146, 148),
                              size: 60,
                            ),
                            Text(
                              'Grupos',
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
        ],
      ),
    );
  }
}
