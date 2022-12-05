import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

Future<String> inserirPessoa(String nome) async {
  String horario =
      DateFormat("dd/MM/yy HH:mm:ss").format(DateTime.now());
  String body = json.encode({"nome": nome, "data": horario});

  var response = await http.post(
      await Uri.parse("https://www.slmm.com.br/CTC/insere.php"),
      headers: {"Accept": "application/json"},
      body: body);

  print(response.body);
  if (response.statusCode != 200) throw Exception('Erro inesperado...');

  return response.body; //json.decode(response.body);
}

class InserirPessoa extends StatefulWidget {
  const InserirPessoa({Key? key}) : super(key: key);

  @override
  _InserirPessoaState createState() => _InserirPessoaState();
}

class _InserirPessoaState extends State<InserirPessoa> {
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
          backgroundColor: Color.fromARGB(255, 104, 20, 156),
          title: const Text("POST dos dados"),
          centerTitle: mounted,
        ),
        body: buildForm());
  }

  Widget buildForm() {
    return Container(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.all(5),
          child: Form(
              child: Padding(
            padding:
                const EdgeInsets.only(bottom: 3, top: 5, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: nomeController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.person),
                      hintText: 'Informe o seu nome'),
                ),
                ElevatedButton(
                    child: const Text('Inserir'),
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
                                      _dadosF =
                                          inserirPessoa(nomeController.text);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Sim"))
                            ],
                          );
                        },
                      );
                    }))
              ],
            ),
          )),
        ));
  }

  // (_dadosF == null) ? buildColumn() : buildFutureBuilder(),

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
