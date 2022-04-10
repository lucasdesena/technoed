import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';

class ProfessorPage extends StatefulWidget {
  final String nome;
  const ProfessorPage(this.nome, {Key? key}) : super(key: key);

  @override
  State<ProfessorPage> createState() => _ProfessorPageState();
}

class _ProfessorPageState extends State<ProfessorPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: const Color.fromARGB(255, 0, 180, 216),
          height: 80,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(
            widget.nome,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 0, 180, 216),
          height: 50,
          width: double.infinity,
          alignment: Alignment.bottomRight,
          child: IconButton(
              tooltip: 'Sair da Conta',
              padding: const EdgeInsets.only(right: 5, bottom: 5),
              icon: const Icon(
                MdiIcons.accountArrowLeftOutline,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () => context.read<AuthService>().logout()),
        ),
      ],
    );
  }
}
