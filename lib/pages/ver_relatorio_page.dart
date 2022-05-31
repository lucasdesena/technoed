import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/widgets/lista_relatorios.dart';

class VerRelatorioPage extends StatefulWidget {
  const VerRelatorioPage({Key? key}) : super(key: key);

  @override
  State<VerRelatorioPage> createState() => _VerRelatorioPageState();
}

class _VerRelatorioPageState extends State<VerRelatorioPage> {
  @override
  Widget build(BuildContext context) {
    String email = context.read<AuthService>().usuario!.email.toString();
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
                      'Relatórios',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Veja relatórios com dados dos desafios',
                      style: TextStyle(
                          color: Color.fromARGB(255, 208, 211, 214),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: ListaRelatorios(email)),
        ],
      ),
    );
  }
}
