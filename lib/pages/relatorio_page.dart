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
  String nome = '';
  String data = '';
  int errosPerguntas = 0;
  int errosTangram = 0;

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
                  'Relatório',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Veja os dados e os resultados dos alunos',
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
                      nome = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['nomes'][index])
                          .single;
                      email = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['emails'][index])
                          .single;
                      data = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['dataRealizada'][index])
                          .single;
                      errosPerguntas = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['errosPerguntas'][index])
                          .single;
                      errosTangram = snapshot.data!.docs
                          .where(
                              (relatorio) => relatorio.id == widget.idRelatorio)
                          .map((doc) => doc['errosTangram'][index])
                          .single;
                      if (errosPerguntas > 0) {
                        for (var pergunta in snapshot.data!.docs
                            .where((relatorio) =>
                                relatorio.id == widget.idRelatorio)
                            .map((doc) => List.from(doc['perguntasErradas']))
                            .single) {
                          perguntasErradas.add(pergunta.toString());
                        }
                      }
                      return Card(
                        child: ListTile(
                          tileColor: const Color.fromARGB(255, 202, 240, 248),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
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
                                'Quantidade de erros no Tangram: ${errosTangram.toString()}',
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
                              Text(
                                'Data da realização: $data',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 143, 146, 148),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              perguntasErradas.isNotEmpty
                                  ? const Text(
                                      'Perguntas que errou:',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 143, 146, 148),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : const Padding(padding: EdgeInsets.all(0.0)),
                              perguntasErradas.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: perguntasErradas.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Text(
                                          perguntasErradas[index],
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
                                        color:
                                            Color.fromARGB(255, 143, 146, 148),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ],
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
