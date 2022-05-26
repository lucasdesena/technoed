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

  adicionarPontuacao(String uid, int pontosObtidos) async {
    QuerySnapshot resultado = await db.collection('usuarios/$uid/dados').get();

    int pontosDaConta = resultado.docs
        .firstWhere((documento) => documento.id == 'pontuação')['pontos'];

    print(pontosDaConta);

    int calculo = pontosDaConta + pontosObtidos;
    String elo = 'nenhum';

    if (calculo > 0 && calculo < 360) {
      elo = 'bronze';
    } else if (calculo >= 360 && calculo < 720) {
      elo = 'prata';
    } else if (calculo >= 720) {
      elo = 'ouro';
    }

    await db
        .collection('usuarios/$uid/dados')
        .doc('pontuação')
        .update({'elo': elo, 'pontos': calculo});
  }

  cadastrarGrupo(String uid, String nomeGrupo, List<String> listaEmails) async {
    await db
        .collection('usuarios/$uid/grupos')
        .doc(nomeGrupo)
        .set({'emails': listaEmails});
  }

  cadastrarEmail(String uid, String nomeGrupo, String email) async {
    List<String> lista = [email];
    await db
        .collection('usuarios/$uid/grupos')
        .doc(nomeGrupo)
        .update({'emails': FieldValue.arrayUnion(lista)});
  }

  cadastrarDesafio(
      List<String> listaEmails,
      List<String> listaPerguntas,
      List<String> listaAlternativas,
      List<String> listaRespostas,
      String dificuldade,
      String titulo) async {
    await db.collection('desafios').doc().set({
      'emails': listaEmails,
      'perguntas': listaPerguntas,
      'alternativas': listaAlternativas,
      'respostas': listaRespostas,
      'dificuldade': dificuldade,
      'titulo': titulo
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
