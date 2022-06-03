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

  cadastrarGrupo(String uid, String nomeGrupo, List<String> listaEmails) async {
    await db
        .collection('usuarios/$uid/grupos')
        .doc(nomeGrupo)
        .set({'emails': listaEmails});
  }

  cadastrarDesafio(
      List<String> listaEmails,
      List<String> listaPerguntas,
      List<String> listaAlternativas,
      List<String> listaRespostas,
      String dificuldade,
      String titulo,
      String idRelatorio) async {
    await db.collection('desafios').doc().set({
      'emails': listaEmails,
      'perguntas': listaPerguntas,
      'alternativas': listaAlternativas,
      'respostas': listaRespostas,
      'dificuldade': dificuldade,
      'titulo': titulo,
      'idRelatorio': idRelatorio
    });
  }

  cadastrarRelatorio(String nomeGrupo, String emailProfessor,
      String tituloDesafio, String dataDesafio) async {
    String idRelatorio = '';
    List<String> listaNome = [];
    List<String> listaEmail = [];
    List<int> listaErrosTangram = [];
    List<int> listaErrosPerguntas = [];
    List<String> perguntasErradas = [];
    List<String> listaData = [];

    await db.collection('relatorios').add({
      'grupo': nomeGrupo,
      'professor': emailProfessor,
      'titulo': tituloDesafio,
      'nomes': listaNome,
      'emails': listaEmail,
      'errosTangram': listaErrosTangram,
      'errosPerguntas': listaErrosPerguntas,
      'perguntasErradas': perguntasErradas,
      'dataDesafio': dataDesafio,
      'dataRealizada': listaData
    }).then((value) {
      idRelatorio = value.id;
    });

    return idRelatorio;
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

  obterNome(String uid) async {
    QuerySnapshot resultado = await db.collection('usuarios/$uid/dados').get();

    return resultado.docs
        .firstWhere((documento) => documento.id == 'cadastro')['nome'];
  }

  adicionarEmail(String uid, String nomeGrupo, String email) async {
    List<String> lista = [email];
    await db
        .collection('usuarios/$uid/grupos')
        .doc(nomeGrupo)
        .update({'emails': FieldValue.arrayUnion(lista)});
  }

  adicionarPontuacao(String uid, int pontosObtidos) async {
    QuerySnapshot resultado = await db.collection('usuarios/$uid/dados').get();

    int pontosDaConta = resultado.docs
        .firstWhere((documento) => documento.id == 'pontuação')['pontos'];

    int calculo = pontosDaConta + pontosObtidos;
    String elo = 'nenhum';

    if (calculo > 0 && calculo < 360) {
      elo = 'Bronze';
    } else if (calculo >= 360 && calculo < 720) {
      elo = 'Prata';
    } else if (calculo >= 720) {
      elo = 'Ouro';
    }

    await db
        .collection('usuarios/$uid/dados')
        .doc('pontuação')
        .update({'elo': elo, 'pontos': calculo});
  }

  editarNome(String uid, String nome) async {
    await db
        .collection('usuarios/$uid/dados')
        .doc('cadastro')
        .update({'nome': nome});
  }

  adicionarDesafioRealizado(
      String idRelatorio,
      String nomeAluno,
      String emailAluno,
      int qtdErrosTangram,
      List<int> qtdErrosPerguntas,
      List<String> perguntasErradas,
      String data) async {
    List<String> listaNome = [nomeAluno];
    List<String> listaEmail = [emailAluno];
    List<int> listaErrosTangram = [qtdErrosTangram];
    List<String> listaData = [data];

    await db.collection('relatorios').doc(idRelatorio).update({
      'nomes': FieldValue.arrayUnion(listaNome),
      'emails': FieldValue.arrayUnion(listaEmail),
      'errosTangram': FieldValue.arrayUnion(listaErrosTangram),
      'errosPerguntas': FieldValue.arrayUnion(qtdErrosPerguntas),
      'perguntasErradas': FieldValue.arrayUnion(perguntasErradas),
      'dataRealizada': FieldValue.arrayUnion(listaData)
    });
  }

  excluirEmails(String uid, String nomeGrupo, String email) async {
    await db.collection('usuarios/$uid/grupos').doc(nomeGrupo).update({
      'emails': FieldValue.arrayRemove([email])
    });
  }

  excluirGrupo(String uid, String nomeGrupo) async {
    await db.collection('usuarios/$uid/grupos').doc(nomeGrupo).delete();
  }

  acessarDesafio(String nomeDesafio, String email) async {
    await db.collection('desafios').doc(nomeDesafio).update({
      'emails': FieldValue.arrayRemove([email])
    });
  }

  excluirDesafio(String nomeDesafio) async {
    await db.collection('desafios').doc(nomeDesafio).delete();
  }
}
