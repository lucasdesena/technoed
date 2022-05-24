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

  cadastrarGrupo(String uid, String nome, List<String> listaEmails) async {
    await db
        .collection('usuarios/$uid/grupos')
        .doc(nome)
        .set({'emails': listaEmails});
  }

  cadastrarDesafio(
      List<String> listaEmails,
      List<String> listaPerguntas,
      List<String> listaAlternativas,
      List<String> listaRespostas,
      String dificuldade) async {
    await db.collection('desafios').doc().set({
      'emails': listaEmails,
      'perguntas': listaPerguntas,
      'alternativas': listaAlternativas,
      'respostas': listaRespostas,
      'dificuldade': dificuldade
    });
  }

  obterEmail(String uid) async {
    QuerySnapshot resultado = await db.collection('usuarios/$uid/dados').get();

    return resultado.docs
        .firstWhere((documento) => documento.id == 'cadastro')['email'];
  }

  obterTipo(String uid) async {
    QuerySnapshot resultado = await db.collection('usuarios/$uid/dados').get();

    return resultado.docs
        .firstWhere((documento) => documento.id == 'cadastro')['tipo'];
  }

  obterGrupos(String uid) async {
    QuerySnapshot resultado = await db.collection('usuarios/$uid/grupos').get();
    List<String> listaGrupos = [];

    for (var grupo in resultado.docs) {
      listaGrupos.add(grupo.id);
    }

    return listaGrupos;
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

  excluirGrupo(String uid, String nomeGrupo) async {
    await db.collection('usuarios/$uid/grupos').doc(nomeGrupo).delete();
  }

  concluirDesafio(String nomeDesafio, String email) async {
    await db.collection('desafios').doc(nomeDesafio).update({
      'emails': FieldValue.arrayRemove([email])
    });
  }

  excluirDesafio(String nomeDesafio, List<String> listaEmails) async {
    await db.collection('desafios').doc(nomeDesafio).delete();
  }
}
