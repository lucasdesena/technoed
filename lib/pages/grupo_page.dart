import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technoed/services/cadastro_service.dart';

class GrupoPage extends StatefulWidget {
  final String uid;
  final String nome;
  const GrupoPage(this.uid, this.nome, {Key? key}) : super(key: key);

  @override
  State<GrupoPage> createState() => _GrupoPageState();
}

class _GrupoPageState extends State<GrupoPage> {
  List<String> lista = <String>[];
  CadastroService cadastro = CadastroService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              AppBar(
                leading: const BackButton(color: Colors.white),
                toolbarHeight: 100,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Gerenciar grupo',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Gerencie os alunos',
                      style: TextStyle(
                          color: Color.fromARGB(255, 208, 211, 214),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: cadastro.db
                .collection('usuarios/${widget.uid}/grupos')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                int tamanho = int.parse(snapshot.data!.docs
                    .where((grupo) => grupo.id.toString() == widget.nome)
                    .map((doc) => List.from(doc['emails']).length)
                    .toString()
                    .substring(1, 2));
                return Expanded(
                  child: ListView.builder(
                    itemCount: tamanho,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                            leading: const Icon(Icons.email_outlined),
                            trailing: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            title: Text(snapshot.data!.docs
                                .where((grupo) =>
                                    grupo.id.toString() == widget.nome)
                                .map((doc) => doc['emails'][index])
                                .toString())),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
