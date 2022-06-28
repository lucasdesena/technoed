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

                      List<String> perguntasErradasAluno = [];

                      perguntasErradas = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => List.from(doc['perguntasErradas']))
                          .single;

                      for (var i = 0; i < perguntasErradas.length; i++) {
                        if (perguntasErradas[i].toString().split(' -')[0] ==
                            email) {
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              'Nome: $nome',
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 143, 146, 148),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Email: $email',
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 143, 146, 148),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Data da realização: $data',
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 143, 146, 148),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    ' \nDesempenho no desafio',
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
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.all(0.0)),
                                perguntasErradasAluno.isNotEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                perguntasErradasAluno.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Text(
                                                perguntasErradasAluno[index],
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 143, 146, 148),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              );
                                            }),
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          'Acertou todas as perguntas!',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
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
