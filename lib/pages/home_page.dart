import 'package:flutter/material.dart';
import 'package:technoed/pages/aluno_page.dart';
import 'package:technoed/pages/professor_page.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class HomePage extends StatefulWidget {
  final AuthService auth;
  const HomePage(this.auth, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CadastroService cadastro = CadastroService();
  String nome = '';
  String tipo = '';

  @override
  void initState() {
    super.initState();
    _ObterDados();
  }

  _ObterDados() {
    cadastro.obterTipo(widget.auth.usuario!.uid).then((value) => setState(() {
          tipo = value;
        }));

    cadastro.obterNome(widget.auth.usuario!.uid).then((value) => setState(() {
          nome = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tipo == 'Aluno' ? const AlunoPage() : ProfessorPage(nome),
    );
  }
}
