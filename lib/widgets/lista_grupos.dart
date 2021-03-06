import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technoed/pages/grupo_page.dart';
import 'package:technoed/services/auth_service.dart';
import 'package:technoed/services/cadastro_service.dart';

class ListaGrupos extends StatelessWidget {
  const ListaGrupos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CadastroService cadastro = CadastroService();
    String uid = context.read<AuthService>().usuario!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: cadastro.db.collection('usuarios/$uid/grupos').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GrupoPage(uid, doc.id),
                      ),
                    );
                  },
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 202, 240, 248),
                    trailing: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            title: const Text(
                              'Confirmação',
                              textAlign: TextAlign.center,
                            ),
                            content: const Text(
                              'Deseja remover esse grupo?',
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  cadastro.excluirGrupo(uid, doc.id);
                                  Navigator.pop(context, 'Sim');
                                },
                                child: const Text('Sim'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancelar'),
                                child: const Text('Cancelar'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                    leading: const Icon(
                      Icons.groups_outlined,
                      color: Color.fromARGB(255, 143, 146, 148),
                    ),
                    title: Text(
                      doc.id,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 143, 146, 148),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
