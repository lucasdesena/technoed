import 'package:flutter/material.dart';
import 'package:technoed/widgets/lista_grupos.dart';

class VerGrupoPage extends StatefulWidget {
  const VerGrupoPage({Key? key}) : super(key: key);

  @override
  State<VerGrupoPage> createState() => _VerGrupoPageState();
}

class _VerGrupoPageState extends State<VerGrupoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              AppBar(
                leading: const BackButton(color: Colors.white),
                toolbarHeight: 100,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Ver grupos',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Veja seus grupos criados',
                      style: TextStyle(
                          color: Color.fromARGB(255, 208, 211, 214),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Expanded(child: ListaGrupos()),
        ],
      ),
    );
  }
}
