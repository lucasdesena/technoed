import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:technoed/services/auth_service.dart';

class RecuperarSenhaPage extends StatefulWidget {
  const RecuperarSenhaPage({Key? key}) : super(key: key);

  @override
  State<RecuperarSenhaPage> createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState extends State<RecuperarSenhaPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();

  ImageProvider imagem = const AssetImage('assets/images/logo.png');

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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 96, 24, 12),
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
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          AuthService().recuperarSenha(email.text);
                        }
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                          msg: 'Email enviado com sucesso!',
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor:
                              const Color.fromARGB(255, 3, 134, 208),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 3, 134, 208),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Recuperar senha',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        formKey.currentState!.reset();
                      });
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Voltar ao Login.',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
