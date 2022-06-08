import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class PerfilAlunoPage extends StatefulWidget {
  final String nome;
  final String elo;
  final int pontos;
  const PerfilAlunoPage(this.nome, this.elo, this.pontos, {Key? key})
      : super(key: key);

  @override
  State<PerfilAlunoPage> createState() => _PerfilAlunoPageState();
}

class _PerfilAlunoPageState extends State<PerfilAlunoPage> {
  String tipo = '';
  final formKey = GlobalKey<FormState>();
  final nome = TextEditingController();
  CadastroService cadastro = CadastroService();

  ImageProvider retornarElo(elo) {
    switch (elo) {
      case 'Ferro':
        return const AssetImage('assets/images/rank-ferro.png');
      case 'Bronze':
        return const AssetImage('assets/images/rank-bronze.png');
      case 'Prata':
        return const AssetImage('assets/images/rank-prata.png');
      case 'Ouro':
        return const AssetImage('assets/images/rank-ouro.png');
      default:
        return const AssetImage('assets/images/rank-ferro.png');
    }
  }

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
          widget.elo == 'nenhum'
              ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.nome,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Sem rank',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10.0),
                            child: SizedBox(
                              height: 90,
                              child: Image(image: retornarElo(widget.elo)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 70.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  widget.nome,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.elo,
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const Icon(
                        MdiIcons.star,
                        color: Colors.amber,
                        size: 25,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            widget.pontos.toString(),
                            colors: [
                              Colors.amber,
                              Colors.amber,
                              const Color.fromARGB(255, 231, 235, 6),
                              const Color.fromARGB(255, 6, 236, 56),
                              const Color.fromARGB(255, 48, 6, 236),
                            ],
                            speed: const Duration(milliseconds: 800),
                            textAlign: TextAlign.center,
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      /*Text(
                        widget.pontos.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
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
                            return 'O campo não pode estar vazio.';
                          }
                          if (value == widget.nome) {
                            return 'O nome já está cadastrado.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 221.0),
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
