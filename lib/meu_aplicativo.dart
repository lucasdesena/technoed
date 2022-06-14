import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technoed/widgets/auth_check.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
    );
  }
}
