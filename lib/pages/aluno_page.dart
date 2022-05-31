import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/pages/lista_desafios_page.dart';
import 'package:technoed/pages/perfil_aluno_page.dart';
import 'package:technoed/pages/sobre_page.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class AlunoPage extends StatefulWidget {
  const AlunoPage({Key? key}) : super(key: key);

  @override
  State<AlunoPage> createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  CadastroService cadastro = CadastroService();
  bool voltar = false;
  String nome = '';
  String elo = '';
  int pontos = 0;

  ImageProvider retornarElo(elo) {
    switch (elo) {
      case 'bronze':
        return const AssetImage('assets/images/rank-bronze.png');
      case 'prata':
        return const AssetImage('assets/images/rank-prata.png');
      case 'ouro':
        return const AssetImage('assets/images/rank-ouro.png');
      default:
        return const AssetImage('assets/images/rank-bronze.png');
    }
  }

  _telaEditar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PerfilAlunoPage(nome, elo, pontos),
      ),
    );
  }

  _telaSobre() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SobrePage(),
      ),
    );
  }

  _telaListaDesafios() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ListaDesafiosPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String uid = context.read<AuthService>().usuario!.uid;
    return WillPopScope(
      onWillPop: () async {
        return voltar;
      },
      child: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: cadastro.db.collection('usuarios/$uid/dados').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                nome = snapshot.data!.docs.map((doc) => doc['nome']).first;
                pontos = snapshot.data!.docs.map((doc) => doc['pontos']).last;
                elo = snapshot.data!.docs.map((doc) => doc['elo']).last;
                return AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 100,
                  centerTitle: elo == 'nenhum' ? false : true,
                  title: Row(
                    mainAxisAlignment: elo == 'nenhum'
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.center,
                    children: <Widget>[
                      elo == 'nenhum'
                          ? const Padding(padding: EdgeInsets.all(0.0))
                          : SizedBox(
                              height: 70,
                              child: Image(image: retornarElo(elo)),
                            ),
                      Text(
                        'Olá, ' + nome,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(right: 14.0),
                          alignment: Alignment.topRight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              const Icon(
                                MdiIcons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Text(
                                pontos.toString(),
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              tooltip: 'Sair da Conta',
                              padding:
                                  const EdgeInsets.only(right: 5, bottom: 5),
                              icon: const Icon(
                                MdiIcons.accountArrowLeftOutline,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () =>
                                  context.read<AuthService>().logout()),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: _telaEditar,
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 144, 224, 239),
                          elevation: 6,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.account_circle_outlined,
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              'Perfil',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: _telaSobre,
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 144, 224, 239),
                          elevation: 6,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.info_outline_rounded,
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              'Sobre',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: _telaListaDesafios,
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 202, 240, 248),
                          elevation: 6,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.rocket_outlined,
                              color: Color.fromARGB(255, 143, 146, 148),
                              size: 60,
                            ),
                            Text(
                              'Vamos jogar?',
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
