import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/pages/lista_desafios_page.dart';
import 'package:technoed/pages/sobre_page.dart';
import 'package:technoed/pages/teste.dart';
import 'package:technoed/services/auth_service.dart';

class AlunoPage extends StatefulWidget {
  final String nome;
  const AlunoPage(this.nome, {Key? key}) : super(key: key);

  @override
  State<AlunoPage> createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  bool voltar = false;

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
    return WillPopScope(
      onWillPop: () async {
        return voltar;
      },
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            title: Text(
              'Olá, ' + widget.nome,
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
                    onPressed: () => context.read<AuthService>().logout()),
              ),
            ],
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
                        onPressed: null,
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
