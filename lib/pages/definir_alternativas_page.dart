import 'package:flutter/material.dart';
import 'package:technoed/pages/escolher_grupo_page.dart';

class DefinirAlternativasPage extends StatefulWidget {
  final String dificuldade;
  final List<String> listaPerguntas;
  const DefinirAlternativasPage(this.dificuldade, this.listaPerguntas,
      {Key? key})
      : super(key: key);

  @override
  State<DefinirAlternativasPage> createState() =>
      _DefinirAlternativasPageState();
}

class _DefinirAlternativasPageState extends State<DefinirAlternativasPage> {
  final formKey = GlobalKey<FormState>();

  String pergunta = '';

  List<String> listaAlternativas = [];
  List<String> listaRespostas = [];

  final alternativa1 = TextEditingController();
  final alternativa2 = TextEditingController();
  final alternativa3 = TextEditingController();
  final alternativa4 = TextEditingController();
  final alternativa5 = TextEditingController();
  final alternativa6 = TextEditingController();
  final alternativa7 = TextEditingController();
  final alternativa8 = TextEditingController();
  final alternativa9 = TextEditingController();
  final alternativa10 = TextEditingController();
  final alternativa11 = TextEditingController();
  final alternativa12 = TextEditingController();
  final alternativa13 = TextEditingController();
  final alternativa14 = TextEditingController();
  final alternativa15 = TextEditingController();
  final alternativa16 = TextEditingController();
  final alternativa17 = TextEditingController();
  final alternativa18 = TextEditingController();
  final alternativa19 = TextEditingController();
  final alternativa20 = TextEditingController();
  final alternativa21 = TextEditingController();
  final alternativa22 = TextEditingController();
  final alternativa23 = TextEditingController();
  final alternativa24 = TextEditingController();
  final alternativa25 = TextEditingController();
  final alternativa26 = TextEditingController();
  final alternativa27 = TextEditingController();

  final respostaPergunta1 = TextEditingController();
  final respostaPergunta2 = TextEditingController();
  final respostaPergunta3 = TextEditingController();
  final respostaPergunta4 = TextEditingController();
  final respostaPergunta5 = TextEditingController();
  final respostaPergunta6 = TextEditingController();
  final respostaPergunta7 = TextEditingController();
  final respostaPergunta8 = TextEditingController();
  final respostaPergunta9 = TextEditingController();

  @override
  void initState() {
    super.initState();
    pergunta = widget.listaPerguntas[0];
  }

  _carregarDificuldade() {
    return widget.dificuldade;
  }

  _carregarListaPerguntas() {
    return widget.listaPerguntas;
  }

  _telaEscolherGrupo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EscolherGrupoPage(_carregarDificuldade(),
            _carregarListaPerguntas(), listaAlternativas, listaRespostas),
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
                  'Alternativas',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Defina as alternativas para cada pergunta',
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
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Pergunta: ' + pergunta,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    pergunta == widget.listaPerguntas[0]
                        ? Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa1,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 1',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa2,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 2',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa3,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 3',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: respostaPergunta1,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_turned_in_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Resposta',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                            ],
                          )
                        : const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                    pergunta == widget.listaPerguntas[1]
                        ? Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa4,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 1',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa5,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 2',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa6,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 3',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: respostaPergunta2,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_turned_in_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Resposta',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                            ],
                          )
                        : const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                    pergunta == widget.listaPerguntas[2]
                        ? Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa7,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 1',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa8,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 2',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa9,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 3',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: respostaPergunta3,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_turned_in_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Resposta',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                            ],
                          )
                        : const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                    pergunta == widget.listaPerguntas[3]
                        ? Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa10,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 1',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa11,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 2',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa12,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 3',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: respostaPergunta4,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_turned_in_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Resposta',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                            ],
                          )
                        : const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                    pergunta == widget.listaPerguntas[4]
                        ? Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa13,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 1',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa14,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 2',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa15,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 3',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: respostaPergunta5,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_turned_in_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Resposta',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                            ],
                          )
                        : const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                    pergunta == widget.listaPerguntas[5]
                        ? Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa16,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 1',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa17,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 2',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa18,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 3',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: respostaPergunta6,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_turned_in_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Resposta',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                            ],
                          )
                        : const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                    pergunta == widget.listaPerguntas[6]
                        ? Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa19,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 1',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa20,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 2',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: alternativa21,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Alternativa 3',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                                padding:
                                    const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                child: TextFormField(
                                  controller: respostaPergunta7,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.assignment_turned_in_outlined,
                                      color: Colors.black,
                                    ),
                                    labelText: 'Resposta',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                            ],
                          )
                        : const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                    widget.dificuldade == 'Difícil'
                        ? pergunta == widget.listaPerguntas[7]
                            ? Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                    child: TextFormField(
                                      controller: alternativa22,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.assignment_outlined,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Alternativa 1',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                    child: TextFormField(
                                      controller: alternativa23,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.assignment_outlined,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Alternativa 2',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                    child: TextFormField(
                                      controller: alternativa24,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.assignment_outlined,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Alternativa 3',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                    child: TextFormField(
                                      controller: respostaPergunta8,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.assignment_turned_in_outlined,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Resposta',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
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
                                ],
                              )
                            : const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              )
                        : const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                    widget.dificuldade == 'Difícil'
                        ? pergunta == widget.listaPerguntas[8]
                            ? Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                    child: TextFormField(
                                      controller: alternativa25,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.assignment_outlined,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Alternativa 1',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                    child: TextFormField(
                                      controller: alternativa26,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.assignment_outlined,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Alternativa 2',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                    child: TextFormField(
                                      controller: alternativa27,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.assignment_outlined,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Alternativa 3',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 6, 24, 6),
                                    child: TextFormField(
                                      controller: respostaPergunta9,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.assignment_turned_in_outlined,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Resposta',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
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
                                ],
                              )
                            : const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              )
                        : const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              if (pergunta == widget.listaPerguntas[0]) {
                                if (listaAlternativas.isNotEmpty) {
                                  listaAlternativas.clear();
                                }
                                if (listaRespostas.isNotEmpty) {
                                  listaRespostas.clear();
                                }
                                listaAlternativas.add(alternativa1.text);
                                listaAlternativas.add(alternativa2.text);
                                listaAlternativas.add(alternativa3.text);
                                listaRespostas.add(respostaPergunta1.text);

                                pergunta = widget.listaPerguntas[1];
                              } else if (pergunta == widget.listaPerguntas[1]) {
                                if (listaAlternativas.length > 3) {
                                  for (var i = 5; i >= 3; i--) {
                                    listaAlternativas.removeAt(i);
                                  }
                                }
                                if (listaRespostas.length > 1) {
                                  listaRespostas.removeAt(1);
                                }
                                listaAlternativas.add(alternativa4.text);
                                listaAlternativas.add(alternativa5.text);
                                listaAlternativas.add(alternativa6.text);
                                listaRespostas.add(respostaPergunta2.text);

                                pergunta = widget.listaPerguntas[2];
                              } else if (pergunta == widget.listaPerguntas[2]) {
                                if (listaAlternativas.length > 6) {
                                  for (var i = 8; i >= 6; i--) {
                                    listaAlternativas.removeAt(i);
                                  }
                                }
                                if (listaRespostas.length > 2) {
                                  listaRespostas.removeAt(2);
                                }
                                listaAlternativas.add(alternativa7.text);
                                listaAlternativas.add(alternativa8.text);
                                listaAlternativas.add(alternativa9.text);
                                listaRespostas.add(respostaPergunta3.text);

                                pergunta = widget.listaPerguntas[3];
                              } else if (pergunta == widget.listaPerguntas[3]) {
                                if (listaAlternativas.length > 9) {
                                  for (var i = 11; i >= 9; i--) {
                                    listaAlternativas.removeAt(i);
                                  }
                                }
                                if (listaRespostas.length > 3) {
                                  listaRespostas.removeAt(3);
                                }
                                listaAlternativas.add(alternativa10.text);
                                listaAlternativas.add(alternativa11.text);
                                listaAlternativas.add(alternativa12.text);
                                listaRespostas.add(respostaPergunta4.text);

                                pergunta = widget.listaPerguntas[4];
                              } else if (pergunta == widget.listaPerguntas[4]) {
                                if (listaAlternativas.length > 12) {
                                  for (var i = 14; i >= 12; i--) {
                                    listaAlternativas.removeAt(i);
                                  }
                                }
                                if (listaRespostas.length > 4) {
                                  listaRespostas.removeAt(4);
                                }
                                listaAlternativas.add(alternativa13.text);
                                listaAlternativas.add(alternativa14.text);
                                listaAlternativas.add(alternativa15.text);
                                listaRespostas.add(respostaPergunta5.text);

                                pergunta = widget.listaPerguntas[5];
                              } else if (pergunta == widget.listaPerguntas[5]) {
                                if (listaAlternativas.length > 15) {
                                  for (var i = 17; i >= 15; i--) {
                                    listaAlternativas.removeAt(i);
                                  }
                                }
                                if (listaRespostas.length > 5) {
                                  listaRespostas.removeAt(5);
                                }
                                listaAlternativas.add(alternativa16.text);
                                listaAlternativas.add(alternativa17.text);
                                listaAlternativas.add(alternativa18.text);
                                listaRespostas.add(respostaPergunta6.text);

                                pergunta = widget.listaPerguntas[6];
                              } else if (pergunta == widget.listaPerguntas[6]) {
                                if (listaAlternativas.length > 18) {
                                  for (var i = 20; i >= 18; i--) {
                                    listaAlternativas.removeAt(i);
                                  }
                                }
                                if (listaRespostas.length > 6) {
                                  listaRespostas.removeAt(6);
                                }
                                listaAlternativas.add(alternativa19.text);
                                listaAlternativas.add(alternativa20.text);
                                listaAlternativas.add(alternativa21.text);
                                listaRespostas.add(respostaPergunta7.text);
                                if (widget.dificuldade == 'Normal') {
                                  _telaEscolherGrupo();
                                }
                              }

                              if (widget.dificuldade == 'Difícil') {
                                pergunta = widget.listaPerguntas[7];
                                if (pergunta == widget.listaPerguntas[7]) {
                                  if (listaAlternativas.length > 21) {
                                    for (var i = 23; i >= 21; i--) {
                                      listaAlternativas.removeAt(i);
                                    }
                                  }
                                  if (listaRespostas.length > 7) {
                                    listaRespostas.removeAt(7);
                                  }
                                  listaAlternativas.add(alternativa22.text);
                                  listaAlternativas.add(alternativa23.text);
                                  listaAlternativas.add(alternativa24.text);
                                  listaRespostas.add(respostaPergunta8.text);

                                  pergunta = widget.listaPerguntas[8];
                                } else if (pergunta ==
                                    widget.listaPerguntas[8]) {
                                  if (listaAlternativas.length > 24) {
                                    for (var i = 26; i >= 24; i--) {
                                      listaAlternativas.removeAt(i);
                                    }
                                  }
                                  if (listaRespostas.length > 8) {
                                    listaRespostas.removeAt(8);
                                  }
                                  listaAlternativas.add(alternativa25.text);
                                  listaAlternativas.add(alternativa26.text);
                                  listaAlternativas.add(alternativa27.text);
                                  listaRespostas.add(respostaPergunta9.text);
                                  _telaEscolherGrupo();
                                }
                              }
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 3, 134, 208),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: widget.dificuldade == 'Normal'
                                  ? pergunta == widget.listaPerguntas[6]
                                      ? const Text(
                                          'Escolher grupo',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      : const Text(
                                          'Avançar',
                                          style: TextStyle(fontSize: 20),
                                        )
                                  : pergunta == widget.listaPerguntas[8]
                                      ? const Text(
                                          'Escolher grupo',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      : const Text(
                                          'Avançar',
                                          style: TextStyle(fontSize: 20),
                                        ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    pergunta == widget.listaPerguntas[0]
                        ? const Padding(
                            padding: EdgeInsets.all(0.0),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (pergunta == widget.listaPerguntas[1]) {
                                    if (listaAlternativas.length > 3) {
                                      for (var i = 5; i >= 3; i--) {
                                        listaAlternativas.removeAt(i);
                                      }
                                    }
                                    if (listaRespostas.length > 1) {
                                      listaRespostas.removeAt(1);
                                    }
                                    pergunta = widget.listaPerguntas[0];
                                  } else if (pergunta ==
                                      widget.listaPerguntas[2]) {
                                    if (listaAlternativas.length > 6) {
                                      for (var i = 8; i >= 6; i--) {
                                        listaAlternativas.removeAt(i);
                                      }
                                    }
                                    if (listaRespostas.length > 2) {
                                      listaRespostas.removeAt(2);
                                    }
                                    pergunta = widget.listaPerguntas[1];
                                  } else if (pergunta ==
                                      widget.listaPerguntas[3]) {
                                    if (listaAlternativas.length > 9) {
                                      for (var i = 11; i >= 9; i--) {
                                        listaAlternativas.removeAt(i);
                                      }
                                    }
                                    if (listaRespostas.length > 3) {
                                      listaRespostas.removeAt(3);
                                    }
                                    pergunta = widget.listaPerguntas[2];
                                  } else if (pergunta ==
                                      widget.listaPerguntas[4]) {
                                    if (listaAlternativas.length > 12) {
                                      for (var i = 14; i >= 12; i--) {
                                        listaAlternativas.removeAt(i);
                                      }
                                    }
                                    if (listaRespostas.length > 4) {
                                      listaRespostas.removeAt(4);
                                    }
                                    pergunta = widget.listaPerguntas[3];
                                  } else if (pergunta ==
                                      widget.listaPerguntas[5]) {
                                    if (listaAlternativas.length > 15) {
                                      for (var i = 17; i >= 15; i--) {
                                        listaAlternativas.removeAt(i);
                                      }
                                    }
                                    if (listaRespostas.length > 5) {
                                      listaRespostas.removeAt(5);
                                    }
                                    pergunta = widget.listaPerguntas[4];
                                  } else if (pergunta ==
                                      widget.listaPerguntas[6]) {
                                    if (listaAlternativas.length > 18) {
                                      for (var i = 20; i >= 18; i--) {
                                        listaAlternativas.removeAt(i);
                                      }
                                    }
                                    if (listaRespostas.length > 6) {
                                      listaRespostas.removeAt(6);
                                    }
                                    pergunta = widget.listaPerguntas[5];
                                  } else if (pergunta ==
                                      widget.listaPerguntas[7]) {
                                    if (listaAlternativas.length > 21) {
                                      for (var i = 23; i >= 21; i--) {
                                        listaAlternativas.removeAt(i);
                                      }
                                    }
                                    if (listaRespostas.length > 7) {
                                      listaRespostas.removeAt(7);
                                    }
                                    pergunta = widget.listaPerguntas[6];
                                  } else if (pergunta ==
                                      widget.listaPerguntas[8]) {
                                    if (listaAlternativas.length > 24) {
                                      for (var i = 26; i >= 24; i--) {
                                        listaAlternativas.removeAt(i);
                                      }
                                    }
                                    if (listaRespostas.length > 8) {
                                      listaRespostas.removeAt(8);
                                    }
                                    pergunta = widget.listaPerguntas[7];
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 0, 180, 216),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Voltar',
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
