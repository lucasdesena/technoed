import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technoed/pages/adicionar_aluno_page.dart';
import 'package:technoed/services/cadastro_service.dart';

class GrupoPage extends StatefulWidget {
  final String uid;
  final String nomeGrupo;
  const GrupoPage(this.uid, this.nomeGrupo, {Key? key}) : super(key: key);

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
                  'Adicione e remova alunos',
                  style: TextStyle(
                      color: Color.fromARGB(255, 208, 211, 214), fontSize: 15),
                ),
              ],
            ),
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
                        .where((grupo) => grupo.id == widget.nomeGrupo)
                        .map((doc) => List.from(doc['emails']).length)
                        .single,
                    itemBuilder: (BuildContext context, int index) {
                      email = snapshot.data!.docs
                          .where((grupo) => grupo.id == widget.nomeGrupo)
                          .map((doc) => doc['emails'][index])
                          .single;
                      return Card(
                        child: ListTile(
                          tileColor: const Color.fromARGB(255, 202, 240, 248),
                          leading: const Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 143, 146, 148),
                          ),
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
                                        cadastro.excluirEmails(widget.uid,
                                            widget.nomeGrupo, email);
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
                          title: Text(
                            email,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 143, 146, 148),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdicionarAlunoPage(widget.nomeGrupo),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 3, 134, 208),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Adicionar alunos',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
