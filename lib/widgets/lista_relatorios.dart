import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
                      leading: const Icon(
                        MdiIcons.fileChartOutline,
                        size: 35,
                        color: Color.fromARGB(255, 143, 146, 148),
                      ),
                      title: Center(
                        child: Text(
                          'Relatório do desafio: \n${doc['titulo']}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          'Grupo: ${doc['grupo']}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 109, 110, 110),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      trailing: Text(
                        doc['dataDesafio'],
                        style: const TextStyle(fontSize: 12),
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
