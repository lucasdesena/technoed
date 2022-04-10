import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';

class AlunoPage extends StatefulWidget {
  const AlunoPage({Key? key}) : super(key: key);

  @override
  State<AlunoPage> createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  bool voltar = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return voltar;
      },
      child: Column(
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 0, 180, 216),
            height: 80,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: const Text(
              'Aluno',
              style: TextStyle(
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
      ),
    );
  }
}
