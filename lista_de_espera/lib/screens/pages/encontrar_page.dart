import 'package:flutter/material.dart';
import 'dart:async';

import 'pessoa_screen.dart';

class EncontrarPessoa extends StatefulWidget {
  const EncontrarPessoa({Key? key}) : super(key: key);

  @override
  _EncontrarPessoaState createState() => _EncontrarPessoaState();
}

class _EncontrarPessoaState extends State<EncontrarPessoa> {
  final nomeController = TextEditingController();
  Future<String>? _dadosF;

  // limpar os controles criados
  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 104, 20, 156),
            title: const Text("Lista de Espera"),
            centerTitle: mounted),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: Column(children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person),
                  hintText: 'Informe o seu nome'),
            ),
            (_dadosF == null) ? buildColumn() : buildFutureBuilder(),
            ElevatedButton(
                onPressed: (() {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Confirmação"),
                        content: const Text("Deseja inserir o nome?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Não")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) =>
                                          PessoaScreen(nomeController.text))));
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text("Sim"))
                        ],
                      );
                    },
                  );
                }),
                child: const Text("Enviar"))
          ]),
        ));
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: nomeController,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // _dadosF = inserirPessoa();
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<String> buildFutureBuilder() {
    return FutureBuilder<String>(
      future: _dadosF,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

class PostDados extends StatefulWidget {
  const PostDados({Key? key}) : super(key: key);

  @override
  State<PostDados> createState() => _PostDadosState();
}

class _PostDadosState extends State<PostDados> {
  final raController = TextEditingController();
  final latController = TextEditingController();
  final longController = TextEditingController();
  final fotoController = TextEditingController();

//limpar controles criados
  @override
  void dispose() {
    raController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Post de dados")),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              //ra

              const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person),
                    hintText: "Informe o RA"),
              ),
              ElevatedButton(
                  onPressed: (() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(raController.text),
                        );
                      },
                    );
                  }),
                  child: const Text("Enviar")),

              //latitude

              const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person),
                    hintText: "Informe a latitude"),
              ),
              ElevatedButton(
                  onPressed: (() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(latController.text),
                        );
                      },
                    );
                  }),
                  child: const Text("Enviar")),

              //longitude

              const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person),
                    hintText: "Informe a longitude"),
              ),
              ElevatedButton(
                  onPressed: (() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(longController.text),
                        );
                      },
                    );
                  }),
                  child: const Text("Enviar")),

              //foto

              const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person),
                    hintText: "Informe o link da foto"),
              ),
              ElevatedButton(
                  onPressed: (() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(fotoController.text),
                        );
                      },
                    );
                  }),
                  child: const Text("Enviar"))
            ],
          ),
        ));
  }
}
