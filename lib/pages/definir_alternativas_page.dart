import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  final pergunta = TextEditingController();
  String dropdownValue = 'Escolha uma pergunta';
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

  final alternativaCorreta1 = TextEditingController();
  final alternativaCorreta2 = TextEditingController();
  final alternativaCorreta3 = TextEditingController();
  final alternativaCorreta4 = TextEditingController();
  final alternativaCorreta5 = TextEditingController();
  final alternativaCorreta6 = TextEditingController();
  final alternativaCorreta7 = TextEditingController();
  final alternativaCorreta8 = TextEditingController();
  final alternativaCorreta9 = TextEditingController();

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
                    widget.dificuldade == 'Normal'
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                  isExpanded: true,
                                  value: dropdownValue,
                                  icon: const Icon(
                                    MdiIcons.chevronDown,
                                    color: Colors.black,
                                  ),
                                  iconSize: 20,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Escolha uma pergunta',
                                    widget.listaPerguntas[0],
                                    widget.listaPerguntas[1],
                                    widget.listaPerguntas[2],
                                    widget.listaPerguntas[3],
                                    widget.listaPerguntas[4],
                                    widget.listaPerguntas[5],
                                    widget.listaPerguntas[6],
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(value),
                                      ),
                                    );
                                  }).toList()),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                  isExpanded: true,
                                  value: dropdownValue,
                                  icon: const Icon(
                                    MdiIcons.chevronDown,
                                    color: Colors.black,
                                  ),
                                  iconSize: 20,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Escolha uma pergunta',
                                    widget.listaPerguntas[0],
                                    widget.listaPerguntas[1],
                                    widget.listaPerguntas[2],
                                    widget.listaPerguntas[3],
                                    widget.listaPerguntas[4],
                                    widget.listaPerguntas[5],
                                    widget.listaPerguntas[6],
                                    widget.listaPerguntas[7],
                                    widget.listaPerguntas[8],
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(value),
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                    dropdownValue == widget.listaPerguntas[0]
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
                                  controller: alternativaCorreta1,
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
                    dropdownValue == widget.listaPerguntas[1]
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
                                  controller: alternativaCorreta2,
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
                    dropdownValue == widget.listaPerguntas[2]
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
                                  controller: alternativaCorreta3,
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
                    dropdownValue == widget.listaPerguntas[3]
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
                                  controller: alternativaCorreta4,
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
                    dropdownValue == widget.listaPerguntas[4]
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
                                  controller: alternativaCorreta5,
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
                    dropdownValue == widget.listaPerguntas[5]
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
                                  controller: alternativaCorreta6,
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
                    dropdownValue == widget.listaPerguntas[6]
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
                                  controller: alternativaCorreta7,
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
                        ? dropdownValue == widget.listaPerguntas[7]
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
                                      controller: alternativaCorreta8,
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
                        ? dropdownValue == widget.listaPerguntas[8]
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
                                      controller: alternativaCorreta9,
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
                          if (formKey.currentState!.validate()) {}
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
