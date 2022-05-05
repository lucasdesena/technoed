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
                                  value: widget.listaPerguntas[0],
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
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
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
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
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
