import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  List<String> listaAlunos = [];
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
                    child: TextFormField(
                      controller: nome,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          MdiIcons.accountGroupOutline,
                          color: Colors.black,
                        ),
                        labelText: 'Nome',
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
                          return 'O campo não pode estar vazio.';
                        }
                        return null;
                      },
                    ),
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
                          return 'O campo não pode estar vazio.';
                        }
                        bool resultado = false;
                        listaAlunos.forEach((element) {
                          if (element == value) {
                            resultado = true;
                            return;
                          }
                        });
                        if (resultado == true) {
                          return 'O email já foi adicionado ao grupo.';
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
                              listaAlunos.add(email.text);
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
                      if (formKey1.currentState!.validate()) {}
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
                      listaAlunos.isEmpty
                          ? const Text(
                              'Nenhum aluno foi inserido no grupo',
                              style: TextStyle(fontSize: 16),
                            )
                          : const Text(
                              'Lista de Alunos:',
                              style: TextStyle(fontSize: 16),
                            ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        children: listaAlunos
                            .map((element) => Card(
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    margin: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Text(element,
                                        style: const TextStyle(
                                            color: Colors.black)),
                                  ),
                                ))
                            .toList()),
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
