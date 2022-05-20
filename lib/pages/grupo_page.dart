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
  String email = '';
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
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs
                        .where((grupo) => grupo.id == widget.nome)
                        .map((doc) => List.from(doc['emails']).length)
                        .single,
                    itemBuilder: (BuildContext context, int index) {
                      email = snapshot.data!.docs
                          .where((grupo) => grupo.id.toString() == widget.nome)
                          .map((doc) => doc['emails'][index])
                          .single;
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.email_outlined),
                          trailing: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: const Text(
                                    'Confirmação',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: const Text(
                                    'Deseja excluir esse email?',
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        cadastro.excluirEmails(
                                            widget.uid, widget.nome, email);
                                        Navigator.pop(context, 'Confirmar');
                                      },
                                      child: const Text('Confirmar'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancelar'),
                                      child: const Text('Cancelar'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          title: Text(email),
                        ),
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
