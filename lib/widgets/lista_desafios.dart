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
                          builder: (_) => DesafioPage(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Dificuldade: ' + doc['dificuldade'],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              } else {
                return Card();
              }
            }).toList(),
          );
        }
      },
    );
  }
}
