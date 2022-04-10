import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:technoed/databases/db_firestore.dart';

class CadastroService extends ChangeNotifier {
  late FirebaseFirestore db;

  CadastroService() {
    db = DBFirestore.get();
  }

  cadastrarDados(
      String uid, String nome, String email, String tipoConta) async {
    await db
        .collection('usuarios/$uid/dadoscadastrais')
        .add({'nome': nome, 'email': email, 'tipo': tipoConta});
  }

  obterNome(String uid) async {
    QuerySnapshot resultado =
        await db.collection('usuarios/$uid/dadoscadastrais').get();

    return resultado.docs.elementAt(0)['nome'];
  }

  obterTipo(String uid) async {
    QuerySnapshot resultado =
        await db.collection('usuarios/$uid/dadoscadastrais').get();

    return resultado.docs.elementAt(0)['tipo'];
  }
}
