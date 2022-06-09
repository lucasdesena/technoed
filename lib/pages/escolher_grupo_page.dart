import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class EscolherGrupoPage extends StatefulWidget {
  final String dificuldade;
  final List<String> listaPerguntas;
  final List<String> listaAlternativas;
  final List<String> listaRespostas;
  final String titulo;
  const EscolherGrupoPage(this.dificuldade, this.listaPerguntas,
      this.listaAlternativas, this.listaRespostas, this.titulo,
      {Key? key})
      : super(key: key);

  @override
  State<EscolherGrupoPage> createState() => _EscolherGrupoPageState();
}

class _EscolherGrupoPageState extends State<EscolherGrupoPage> {
  List<String> listaEmails = [];
  DateTime data = DateTime.now();

  CadastroService cadastro = CadastroService();

  cadastrarRelatorioEDesafio(
      String nomeGrupo, String email, List<String> listaEmails) {
    cadastro
        .cadastrarRelatorio(nomeGrupo, email, widget.titulo,
            DateFormat('dd/MM/yyyy').format(data))
        .then((value) {
      cadastro.cadastrarDesafio(
          listaEmails,
          widget.listaPerguntas,
          widget.listaAlternativas,
          widget.listaRespostas,
          widget.dificuldade,
          widget.titulo,
          value);
    });
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authCheck',
        //Não funcionou ModalRoute withName
        ModalRoute.withName('/authCheck'));
    Fluttertoast.showToast(
      msg: 'Desafio criado com sucesso!',
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: const Color.fromARGB(255, 0, 180, 216),
    );
  }

  @override
  Widget build(BuildContext context) {
    String uid = context.read<AuthService>().usuario!.uid;
    String email = context.read<AuthService>().usuario!.email.toString();
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
                  'Grupo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Escolha o grupo para aplicar o desafio',
                  style: TextStyle(
                      color: Color.fromARGB(255, 208, 211, 214), fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  cadastro.db.collection('usuarios/$uid/grupos').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView(
                    children: snapshot.data!.docs.map((doc) {
                      return Card(
                        child: GestureDetector(
                          onTap: () {
                            listaEmails = List<String>.from(snapshot.data!.docs
                                .where((grupo) => grupo.id == doc.id)
                                .map((doc) => doc['emails'])
                                .single);
                            if (listaEmails.isNotEmpty) {
                              cadastrarRelatorioEDesafio(
                                  doc.id, email, listaEmails);
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: const Text(
                                    'Aviso',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: const Text(
                                    'Esse grupo não pode ser escolhido, pois não há alunos nele.',
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Ok');
                                      },
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: ListTile(
                            tileColor: const Color.fromARGB(255, 202, 240, 248),
                            leading: const Icon(
                              Icons.groups_outlined,
                              color: Color.fromARGB(255, 143, 146, 148),
                            ),
                            title: Text(
                              doc.id,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 143, 146, 148),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: const Icon(
                              MdiIcons.listStatus,
                              color: Color.fromARGB(255, 143, 146, 148),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
