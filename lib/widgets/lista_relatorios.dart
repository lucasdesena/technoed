import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technoed/pages/relatorio_page.dart';
import 'package:technoed/services/cadastro_service.dart';

class ListaRelatorios extends StatelessWidget {
  final String emailProfessor;
  const ListaRelatorios(this.emailProfessor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CadastroService cadastro = CadastroService();
    return StreamBuilder<QuerySnapshot>(
      stream: cadastro.db.collection('relatorios').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              if (emailProfessor == doc['professor']) {
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RelatorioPage(doc.id),
                        ),
                      );
                    },
                    child: ListTile(
                      tileColor: const Color.fromARGB(255, 202, 240, 248),
                      title: Column(
                        children: <Widget>[
                          Text(
                            'Relatório do desafio: \n${doc['titulo']}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Grupo: ${doc['grupo']}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 109, 110, 110),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
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
