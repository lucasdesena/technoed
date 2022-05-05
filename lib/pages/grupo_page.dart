import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class GrupoPage extends StatefulWidget {
  final String nome;
  const GrupoPage(this.nome, {Key? key}) : super(key: key);

  @override
  State<GrupoPage> createState() => _GrupoPageState();
}

class _GrupoPageState extends State<GrupoPage> {
  @override
  Widget build(BuildContext context) {
    CadastroService cadastro = CadastroService();
    String uid = context.read<AuthService>().usuario!.uid;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              AppBar(
                leading: const BackButton(color: Colors.white),
                toolbarHeight: 100,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Gerenciar grupo',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Altere o nome do grupo e gerencie os alunos',
                      style: TextStyle(
                          color: Color.fromARGB(255, 208, 211, 214),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    cadastro.db.collection('usuarios/$uid/grupos').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    int quantidade = 0;
                    Iterable<dynamic> lista =
                        snapshot.data!.docs.map((doc) => doc['emails']);
                    lista.forEach((element) {
                      quantidade = List.from(element).length;
                    });
                    return ListView.builder(
                      itemCount: quantidade,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Card(
                          child: GestureDetector(
                            child: ListTile(
                              title: Text(
                                snapshot.data!.docs
                                    .map((doc) => doc.id == widget.nome
                                        ? doc['emails'][index]
                                        : "")
                                    .toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ));
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
