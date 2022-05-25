import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:technoed/pages/definir_perguntas_page.dart';

class DefinirTituloPage extends StatefulWidget {
  final String dificuldade;
  const DefinirTituloPage(this.dificuldade, {Key? key}) : super(key: key);

  @override
  State<DefinirTituloPage> createState() => _DefinirTituloPageState();
}

class _DefinirTituloPageState extends State<DefinirTituloPage> {
  final formKey = GlobalKey<FormState>();
  final titulo = TextEditingController();

  telaDefinirPerguntas() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DefinirPerguntasPage(widget.dificuldade, titulo.text),
      ),
    );
  }

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
                  'Título',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Defina o título do desafio',
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
              child: TextFormField(
                controller: titulo,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    MdiIcons.formatTitle,
                    color: Colors.black,
                  ),
                  labelText: 'Título',
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
                    return 'Insira o título corretamente!';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  telaDefinirPerguntas();
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
                      'Avançar',
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
