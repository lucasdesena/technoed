import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technoed/services/cadastro_service.dart';

class RelatorioPage extends StatefulWidget {
  final String idRelatorio;
  const RelatorioPage(this.idRelatorio, {Key? key}) : super(key: key);

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State<RelatorioPage> {
  String email = '';
  String pegarNome = '';
  String pegarData = '';
  String pegarErrosPerguntas = '';
  String pegarErrosTangram = '';

  List<dynamic> perguntasErradas = [];

  CadastroService cadastro = CadastroService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            leading: const BackButton(color: Colors.white),
            toolbarHeight: 100,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Relatórios',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Veja os resultados dos alunos',
                  style: TextStyle(
                      color: Color.fromARGB(255, 208, 211, 214), fontSize: 15),
                ),
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: cadastro.db.collection('relatorios').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs
                        .where(
                            (relatorio) => relatorio.id == widget.idRelatorio)
                        .map((doc) => List.from(doc['emails']).length)
                        .single,
                    itemBuilder: (BuildContext context, int index) {
                      pegarNome = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['nomes'][index])
                          .single;
                      String nome = pegarNome.split('-')[1];

                      email = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['emails'][index])
                          .single;

                      pegarData = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['dataRealizada'][index])
                          .single;
                      String data = pegarData.split('-')[1];

                      pegarErrosPerguntas = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['errosPerguntas'][index])
                          .single;
                      int errosPerguntas =
                          int.parse(pegarErrosPerguntas.split('-')[1]);

                      pegarErrosTangram = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['errosTangram'][index])
                          .single;
                      String errosTangram = pegarErrosTangram.split('-')[1];

                      String pegarIndexAnterior = '';
                      int indexAnterior = 0;
                      int indexAtual = 0;
                      List<String> perguntasErradasAluno = [];

                      if (errosPerguntas > 0) {
                        perguntasErradas = snapshot.data!.docs
                            .where((relatorio) =>
                                relatorio.id == widget.idRelatorio)
                            .map((doc) => List.from(doc['perguntasErradas']))
                            .single;

                        if (index > 0) {
                          pegarIndexAnterior = snapshot.data!.docs
                              .where((relatorio) =>
                                  relatorio.id == widget.idRelatorio)
                              .map((doc) => doc['errosPerguntas'][index - 1])
                              .single;
                          indexAnterior =
                              int.parse(pegarIndexAnterior.split('-')[1]);
                        }

                        indexAtual = indexAnterior + errosPerguntas;
                        for (var i = indexAnterior; i < indexAtual; i++) {
                          perguntasErradasAluno.add(
                              perguntasErradas[i].toString().split('-')[1]);
                        }
                      }
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Card(
                          child: ListTile(
                            tileColor: const Color.fromARGB(255, 202, 240, 248),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    'Dados do aluno',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Nome: $nome',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 143, 146, 148),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Email: $email',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 143, 146, 148),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Data da realização: $data \n',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 143, 146, 148),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    'Desempenho no desafio',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Quantidade de erros no Tangram: $errosTangram',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 143, 146, 148),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Quantidade de erros nas perguntas: ${errosPerguntas.toString()}',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 143, 146, 148),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                perguntasErradasAluno.isNotEmpty
                                    ? const Text(
                                        'Perguntas que errou:',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 143, 146, 148),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.all(0.0)),
                                perguntasErradasAluno.isNotEmpty
                                    ? ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: perguntasErradasAluno.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Text(
                                            perguntasErradasAluno[index],
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 143, 146, 148),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        })
                                    : const Text(
                                        'Acertou todas as perguntas',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 143, 146, 148),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
