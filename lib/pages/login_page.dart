import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoed/pages/recuperar_senha_page.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:technoed/services/cadastro_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  final repetirSenha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  ImageProvider imagem = const AssetImage('assets/images/logo.png');

  String dropdownValue = 'Aluno';

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      if (formKey.currentState != null) {
        formKey.currentState!.reset();
      }
      isLogin = acao;
      if (isLogin) {
        actionButton = 'Login';
        toggleButton = 'Não possui cadastro? Cadastre-se agora.';
        email.clear();
        senha.clear();
      } else {
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
        nome.clear();
        repetirSenha.clear();
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
      String uid = context.read<AuthService>().usuario!.uid;
      if (uid.isNotEmpty) {
        await CadastroService()
            .cadastrarDados(uid, nome.text, email.text, dropdownValue);
        if (dropdownValue == 'Aluno') {
          await CadastroService().cadastrarPontuacao(uid);
        }
      }
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 180, 216),
      body: SingleChildScrollView(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color.fromARGB(255, 0, 180, 216),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Image(image: imagem),
                  ),
                  !isLogin
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                          child: TextFormField(
                            maxLength: 14,
                            controller: nome,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                MdiIcons.accountOutline,
                                color: Colors.white,
                              ),
                              labelText: 'Nome',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              counterText: '',
                            ),
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe o nome corretamente!';
                              }
                              return null;
                            },
                          ),
                        )
                      : const Padding(padding: EdgeInsets.all(0)),
                  Padding(
                    padding: !isLogin
                        ? const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 24.0)
                        : const EdgeInsets.fromLTRB(24, 96, 24, 12),
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o email corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 24.0),
                    child: TextFormField(
                      controller: senha,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe a sua senha!';
                        } else if (value.length < 6) {
                          return 'Sua senha deve ter no mínimo 6 caracteres';
                        }
                        return null;
                      },
                    ),
                  ),
                  !isLogin
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 24.0),
                          child: TextFormField(
                            controller: repetirSenha,
                            obscureText: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              labelText: 'Repita a senha',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Repita a senha!';
                              } else if (value != senha.text) {
                                return 'A senha digitada não é igual';
                              }
                              return null;
                            },
                          ),
                        )
                      : const Padding(padding: EdgeInsets.all(0)),
                  !isLogin
                      ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 180, 216),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                ),
                                isExpanded: true,
                                value: dropdownValue,
                                icon: const Icon(
                                  MdiIcons.chevronDown,
                                  color: Colors.white,
                                ),
                                iconSize: 20,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Aluno',
                                  'Professor'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Center(
                                      child: Text(value),
                                    ),
                                  );
                                }).toList()),
                          ),
                        )
                      : const Padding(padding: EdgeInsets.all(0)),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (isLogin) {
                            login();
                          } else {
                            registrar();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 3, 134, 208),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (loading)
                            ? [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ]
                            : [
                                const Icon(Icons.check),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    actionButton,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                      ),
                    ),
                  ),
                  !isLogin
                      ? const Padding(padding: EdgeInsets.all(0.0))
                      : TextButton(
                          onPressed: () {
                            setState(() {
                              formKey.currentState!.reset();
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RecuperarSenhaPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                  TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(
                      toggleButton,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
