import 'package:flutter/material.dart';
import 'package:technoed/pages/definir_alternativas_page.dart';

class CriarDesafioPage extends StatefulWidget {
  final String dificuldade;
  const CriarDesafioPage(this.dificuldade, {Key? key}) : super(key: key);

  @override
  State<CriarDesafioPage> createState() => _CriarDesafioPageState();
}

class _CriarDesafioPageState extends State<CriarDesafioPage> {
  final formKey = GlobalKey<FormState>();
  final pergunta1 = TextEditingController();
  final pergunta2 = TextEditingController();
  final pergunta3 = TextEditingController();
  final pergunta4 = TextEditingController();
  final pergunta5 = TextEditingController();
  final pergunta6 = TextEditingController();
  final pergunta7 = TextEditingController();
  final pergunta8 = TextEditingController();
  final pergunta9 = TextEditingController();

  _telaDefinirAlternativas() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DefinirAlternativasPage(),
      ),
    );
  }

  List<String> listaPerguntas = [];
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
                  'Perguntas',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Defina as perguntas do desafio',
                  style: TextStyle(
                      color: Color.fromARGB(255, 208, 211, 214), fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                      child: TextFormField(
                        controller: pergunta1,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.assignment_outlined,
                            color: Colors.black,
                          ),
                          labelText: 'Pergunta 1',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                      child: TextFormField(
                        controller: pergunta2,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.assignment_outlined,
                            color: Colors.black,
                          ),
                          labelText: 'Pergunta 2',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                      child: TextFormField(
                        controller: pergunta3,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.assignment_outlined,
                            color: Colors.black,
                          ),
                          labelText: 'Pergunta 3',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                      child: TextFormField(
                        controller: pergunta4,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.assignment_outlined,
                            color: Colors.black,
                          ),
                          labelText: 'Pergunta 4',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                      child: TextFormField(
                        controller: pergunta5,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.assignment_outlined,
                            color: Colors.black,
                          ),
                          labelText: 'Pergunta 5',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                      child: TextFormField(
                        controller: pergunta6,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.assignment_outlined,
                            color: Colors.black,
                          ),
                          labelText: 'Pergunta 6',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                      child: TextFormField(
                        controller: pergunta7,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.assignment_outlined,
                            color: Colors.black,
                          ),
                          labelText: 'Pergunta 7',
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
                    widget.dificuldade == 'Normal'
                        ? const Padding(padding: EdgeInsets.all(0.0))
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                            child: TextFormField(
                              controller: pergunta8,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.assignment_outlined,
                                  color: Colors.black,
                                ),
                                labelText: 'Pergunta 8',
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
                    widget.dificuldade == 'Normal'
                        ? const Padding(padding: EdgeInsets.all(0.0))
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                            child: TextFormField(
                              controller: pergunta9,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.assignment_outlined,
                                  color: Colors.black,
                                ),
                                labelText: 'Pergunta 9',
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
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              listaPerguntas.add(pergunta1.text);
                              listaPerguntas.add(pergunta2.text);
                              listaPerguntas.add(pergunta3.text);
                              listaPerguntas.add(pergunta4.text);
                              listaPerguntas.add(pergunta5.text);
                              listaPerguntas.add(pergunta6.text);
                              listaPerguntas.add(pergunta7.text);
                              if (widget.dificuldade == 'Difícil') {
                                listaPerguntas.add(pergunta8.text);
                                listaPerguntas.add(pergunta9.text);
                              }
                            });
                            _telaDefinirAlternativas();
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
