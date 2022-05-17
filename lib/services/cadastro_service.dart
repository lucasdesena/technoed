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
        .collection('usuarios/$uid/dados')
        .doc('cadastro')
        .set({'nome': nome, 'email': email, 'tipo': tipoConta});
  }

  cadastrarPontuacao(String uid) async {
    await db
        .collection('usuarios/$uid/dados')
        .doc('pontuação')
        .set({'elo': 'nenhum', 'pontos': 0});
  }

  cadastrarGrupo(String uid, String nome, List<String> lista) async {
    if (lista.isNotEmpty) {
      await db
          .collection('usuarios/$uid/grupos')
          .doc(nome)
          .set({'emails': lista});
    }
  }

  editarNome(String uid, String nome) async {
    await db
        .collection('usuarios/$uid/dados')
        .doc('cadastro')
        .update({'nome': nome});
  }

  excluirEmails(String uid, String nomeGrupo, String email) async {
    await db.collection('usuarios/$uid/grupos').doc(nomeGrupo).update({
      'emails': FieldValue.arrayRemove([email])
    });
  }

  obterNome(String uid) async {
    QuerySnapshot resultado = await db.collection('usuarios/$uid/dados').get();

    return resultado.docs
        .firstWhere((documento) => documento.id == 'cadastro')['nome'];
  }

  obterTipo(String uid) async {
    QuerySnapshot resultado = await db.collection('usuarios/$uid/dados').get();

    return resultado.docs
        .firstWhere((documento) => documento.id == 'cadastro')['tipo'];
  }
}
