import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/pages/perfil_page_professor.dart';
import 'package:technoed/pages/sobre_page.dart';
import 'package:technoed/pages/escolher_desafio_page.dart';
import 'package:technoed/pages/gerenciar_grupos_page.dart';
import 'package:technoed/pages/ver_relatorio_page.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class ProfessorPage extends StatefulWidget {
  const ProfessorPage({Key? key}) : super(key: key);

  @override
  State<ProfessorPage> createState() => _ProfessorPageState();
}

class _ProfessorPageState extends State<ProfessorPage> {
  CadastroService cadastro = CadastroService();
  bool voltar = false;
  String nome = '';

  _telaEditar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PerfilPageProfessor(nome),
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

  _telaEscolhaDesafio() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EscolherDesafioPage(),
      ),
    );
  }

  _telaGerenciamentoGrupos() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const GerenciarGruposPage(),
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
      child: SingleChildScrollView(
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
                  nome = snapshot.data!.docs.map((doc) => doc['nome']).single;
                  return AppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 100,
                    title: Text(
                      'Olá, ' + nome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    centerTitle: true,
                    actions: <Widget>[
                      Container(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            tooltip: 'Sair da Conta',
                            padding: const EdgeInsets.only(right: 5, bottom: 5),
                            icon: const Icon(
                              MdiIcons.accountArrowLeftOutline,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () =>
                                context.read<AuthService>().logout()),
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                          onPressed: _telaEscolhaDesafio,
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 202, 240, 248),
                            elevation: 6,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.ads_click,
                                color: Color.fromARGB(255, 143, 146, 148),
                                size: 60,
                              ),
                              Text(
                                'Novo desafio',
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
                          onPressed: _telaGerenciamentoGrupos,
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 202, 240, 248),
                            elevation: 6,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.group_outlined,
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const VerRelatorioPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 202, 240, 248),
                            elevation: 6,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.insert_chart_outlined_outlined,
                                color: Color.fromARGB(255, 143, 146, 148),
                                size: 60,
                              ),
                              Text(
                                'Relatórios',
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
      ),
    );
  }
}
