import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class EscolherGrupoPage extends StatefulWidget {
  final String dificuldade;
  final List<String> listaPerguntas;
  final List<String> listaAlternativas;
  final List<String> listaRespostas;
  const EscolherGrupoPage(this.dificuldade, this.listaPerguntas,
      this.listaAlternativas, this.listaRespostas,
      {Key? key})
      : super(key: key);

  @override
  State<EscolherGrupoPage> createState() => _EscolherGrupoPageState();
}

class _EscolherGrupoPageState extends State<EscolherGrupoPage> {
  List<String> listaEmails = [];

  @override
  Widget build(BuildContext context) {
    CadastroService cadastro = CadastroService();
    String uid = context.read<AuthService>().usuario!.uid;
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
                                .where((grupo) => grupo.id.toString() == doc.id)
                                .map((doc) => doc['emails'])
                                .single);
                            cadastro.cadastrarDesafio(
                                listaEmails,
                                widget.listaPerguntas,
                                widget.listaAlternativas,
                                widget.listaRespostas,
                                widget.dificuldade);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/authCheck',
                                //Não funcionou ModalRoute withName
                                ModalRoute.withName('/authCheck'));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Desafio criado com sucesso!')));
                          },
                          child: ListTile(
                            title: Text(
                              doc.id,
                              textAlign: TextAlign.center,
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
