import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class AdicionarAlunoPage extends StatefulWidget {
  final String nomeGrupo;
  const AdicionarAlunoPage(this.nomeGrupo, {Key? key}) : super(key: key);

  @override
  State<AdicionarAlunoPage> createState() => _AdicionarAlunoPageState();
}

class _AdicionarAlunoPageState extends State<AdicionarAlunoPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();

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
                  'Adicionar alunos',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Adicione novos alunos ao grupo',
                  style: TextStyle(
                      color: Color.fromARGB(255, 208, 211, 214), fontSize: 15),
                ),
              ],
            ),
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
              child: StreamBuilder<QuerySnapshot>(
                  stream: cadastro.db
                      .collection('usuarios/$uid/grupos')
                      .snapshots(),
                  builder: (context, snapshot) {
                    return TextFormField(
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
                        List<String> listaEmails = List<String>.from(snapshot
                            .data!.docs
                            .where((grupo) => grupo.id == widget.nomeGrupo)
                            .map((doc) => doc['emails'])
                            .single);
                        bool resultado = false;
                        listaEmails.forEach((element) {
                          if (element == value) {
                            resultado = true;
                            return;
                          }
                        });
                        if (resultado == true) {
                          return 'Esse email já foi adicionado ao grupo.';
                        }
                        return null;
                      },
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  cadastro.adicionarEmail(uid, widget.nomeGrupo, email.text);
                  Navigator.pop(context);
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
                      'Confirmar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
