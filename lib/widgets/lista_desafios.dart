import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoed/pages/desafio_page.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class ListaDesafios extends StatelessWidget {
  const ListaDesafios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CadastroService cadastro = CadastroService();
    String uid = context.read<AuthService>().usuario!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: cadastro.db.collection('usuarios/$uid/desafios').snapshots(),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DesafioPage(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(doc['desafio']),
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}