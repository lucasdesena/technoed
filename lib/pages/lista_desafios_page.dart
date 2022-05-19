import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';
import 'package:technoed/widgets/lista_desafios.dart';

class ListaDesafiosPage extends StatefulWidget {
  const ListaDesafiosPage({Key? key}) : super(key: key);

  @override
  State<ListaDesafiosPage> createState() => _ListaDesafiosPageState();
}

class _ListaDesafiosPageState extends State<ListaDesafiosPage> {
  String email = '';

  @override
  void initState() {
    super.initState();
    CadastroService cadastro = CadastroService();
    String uid = context.read<AuthService>().usuario!.uid;
    cadastro.obterEmail(uid).then((value) => setState(() {
          email = value;
        }));
  }

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
                      'Vamos jogar?',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Escolha um desafio e... divirta-se!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 208, 211, 214),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: ListaDesafios(email)),
        ],
      ),
    );
  }
}
