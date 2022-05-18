import 'package:flutter/material.dart';
import 'package:technoed/pages/definir_perguntas_page.dart';
import 'package:technoed/pages/escolher_desafio_page.dart';
import 'package:technoed/pages/professor_page.dart';
import 'package:technoed/widgets/auth_check.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'technoed',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromARGB(255, 0, 180, 216),
          ),
        ),
        home: AuthCheck(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/authCheck':
              return MaterialPageRoute(builder: (context) => AuthCheck());
            default:
              return null;
          }
        });
  }
}
