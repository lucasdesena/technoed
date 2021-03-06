import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class CriarGrupoPage extends StatefulWidget {
  const CriarGrupoPage({Key? key}) : super(key: key);

  @override
  State<CriarGrupoPage> createState() => _CriarGrupoPageState();
}

class _CriarGrupoPageState extends State<CriarGrupoPage> {
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final nome = TextEditingController();
  final email = TextEditingController();

  List<String> listaEmails = [];

  CadastroService cadastro = CadastroService();

  @override
  Widget build(BuildContext context) {
    String uid = context.read<AuthService>().usuario!.uid;
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            leading: const BackButton(color: Colors.white),
            toolbarHeight: 100,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Novo grupo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Defina um nome e adicione os alunos',
                  style: TextStyle(
                      color: Color.fromARGB(255, 208, 211, 214), fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Form(
                  key: formKey1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: cadastro.db
                            .collection('usuarios/$uid/grupos')
                            .snapshots(),
                        builder: (context, snapshot) {
                          return TextFormField(
                            controller: nome,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                MdiIcons.accountGroupOutline,
                                color: Colors.black,
                              ),
                              labelText: 'Nome do grupo',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            validator: (value) {
                              bool resultado = false;
                              List<String> listaGrupos = List<String>.from(
                                  snapshot.data!.docs.map((doc) => doc.id));

                              listaGrupos.forEach((element) {
                                if (element == value) {
                                  resultado = true;
                                  return;
                                }
                              });
                              if (value!.isEmpty) {
                                return 'O campo n??o pode estar vazio.';
                              }
                              if (resultado == true) {
                                return 'J?? existe um grupo com esse nome.';
                              }
                              return null;
                            },
                          );
                        }),
                  ),
                ),
                Form(
                  key: formKey2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          MdiIcons.emailOutline,
                          color: Colors.black,
                        ),
                        labelText: 'Email do aluno',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'O campo n??o pode estar vazio.';
                        }
                        bool resultado = false;
                        listaEmails.forEach((element) {
                          if (element == value) {
                            resultado = true;
                            return;
                          }
                        });
                        if (resultado == true) {
                          return 'Esse email j?? foi adicionado ao grupo.';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (formKey2.currentState!.validate()) {
                            setState(() {
                              listaEmails.add(email.text);
                            });
                          }
                          email.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 144, 224, 239),
                        ),
                        child: const Text(
                          "Adicionar aluno",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey1.currentState!.validate()) {
                        cadastro.cadastrarGrupo(uid, nome.text, listaEmails);
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                          msg: 'Grupo criado com sucesso!',
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor:
                              const Color.fromARGB(255, 0, 180, 216),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 3, 134, 208),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Criar grupo',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      listaEmails.isEmpty
                          ? const Text(
                              'Nenhum aluno foi adicionado ao grupo',
                              style: TextStyle(fontSize: 16),
                            )
                          : const Text(
                              'Lista de alunos:',
                              style: TextStyle(fontSize: 16),
                            ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Column(
                          children: listaEmails
                              .map(
                                (email) => Card(
                                  child: ListTile(
                                    tileColor: const Color.fromARGB(
                                        255, 202, 240, 248),
                                    leading: const Icon(
                                      Icons.email_outlined,
                                      color: Color.fromARGB(255, 143, 146, 148),
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            actionsAlignment:
                                                MainAxisAlignment.center,
                                            title: const Text(
                                              'Confirma????o',
                                              textAlign: TextAlign.center,
                                            ),
                                            content: const Text(
                                              'Deseja remover esse aluno?',
                                              textAlign: TextAlign.center,
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    listaEmails.removeWhere(
                                                        (element) =>
                                                            element == email);
                                                  });
                                                  Navigator.pop(context, 'Sim');
                                                },
                                                child: const Text('Sim'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancelar'),
                                                child: const Text('Cancelar'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                    title: Text(
                                      email,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 143, 146, 148),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
