import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class PerfilProfessorPage extends StatefulWidget {
  final String nome;
  const PerfilProfessorPage(this.nome, {Key? key}) : super(key: key);

  @override
  State<PerfilProfessorPage> createState() => _PerfilProfessorPageState();
}

class _PerfilProfessorPageState extends State<PerfilProfessorPage> {
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
                    size: 25,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cadastro.editarNome(uid, nome.text);
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                        msg: 'Nome alterado com sucesso!',
                        toastLength: Toast.LENGTH_LONG,
                        backgroundColor: const Color.fromARGB(255, 0, 180, 216),
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
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                      child: TextFormField(
                        maxLength: 14,
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
                            return 'O nome j?? est?? cadastrado.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 382.0),
                    child: SizedBox(
                      height: 90,
                      child: Image.asset('assets/images/logo-alt.png'),
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
