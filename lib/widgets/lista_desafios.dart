import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technoed/pages/desafio_page.dart';
import 'package:technoed/services/cadastro_service.dart';

class ListaDesafios extends StatelessWidget {
  final String emailAluno;
  const ListaDesafios(this.emailAluno, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CadastroService cadastro = CadastroService();
    return StreamBuilder<QuerySnapshot>(
      stream: cadastro.db.collection('desafios').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              if (List<String>.from(doc['emails']).isEmpty) {
                cadastro.excluirDesafio(doc.id);
              }
              bool emailNaLista = false;
              for (var email in doc['emails']) {
                if (email == emailAluno) {
                  emailNaLista = true;
                  break;
                }
              }
              if (emailNaLista == true) {
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DesafioPage(
                              doc.id, doc['dificuldade'], emailAluno),
                        ),
                      );
                    },
                    child: ListTile(
                      //tileColor: const Color.fromARGB(255, 202, 240, 248),
                      title: Column(
                        children: <Widget>[
                          Text(
                            doc['titulo'],
                            textAlign: TextAlign.center,
                            //style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            doc['dificuldade'],
                            style: const TextStyle(
                                color: Color.fromARGB(255, 109, 110, 110),
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Card();
              }
            }).toList(),
          );
        }
      },
    );
  }
}
