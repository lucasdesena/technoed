import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class PerfilPageProfessor extends StatefulWidget {
  final String nome;
  const PerfilPageProfessor(this.nome, {Key? key}) : super(key: key);

  @override
  State<PerfilPageProfessor> createState() => _PerfilPageProfessorState();
}

class _PerfilPageProfessorState extends State<PerfilPageProfessor> {
  final formKey = GlobalKey<FormState>();
  final nome = TextEditingController();
  CadastroService cadastro = CadastroService();

  @override
  void initState() {
    super.initState();
    nome.text = widget.nome;
  }

  @override
  Widget build(BuildContext context) {
    String uid = context.read<AuthService>().usuario!.uid;
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            leading: const BackButton(color: Colors.white),
            toolbarHeight: 100,
            title: const Text(
              'Perfil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            actions: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  tooltip: 'Salvar',
                  padding: const EdgeInsets.only(right: 5, bottom: 5),
                  icon: const Icon(
                    MdiIcons.check,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cadastro.editarNome(uid, nome.text);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Nome alterado com sucesso!')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
                child: Icon(
                  MdiIcons.pencilOutline,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
                child: Text(
                  'Editar nome',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                  child: TextFormField(
                    controller: nome,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        MdiIcons.accountOutline,
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
                        return 'Informe o nome corretamente!';
                      }
                      if (value == widget.nome) {
                        return 'O nome já está cadastrado';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
