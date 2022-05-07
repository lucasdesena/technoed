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
  bool isLoading = true;
  String tipo = '';
  CadastroService cadastro = CadastroService();

  loading() {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 0, 180, 216),
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  pagina() {
    return Scaffold(
      body: tipo == 'Aluno' ? const AlunoPage() : const ProfessorPage(),
    );
  }

  @override
  void initState() {
    super.initState();
    obterDados();
  }

  obterDados() {
    cadastro.obterTipo(widget.auth.usuario!.uid).then((value) => setState(() {
          tipo = value;
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) =>
      isLoading == true ? loading() : pagina();
}
