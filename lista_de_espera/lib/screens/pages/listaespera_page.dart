import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'package:lista_de_espera/models/lista_data.dart';

// puxa dados da api e os coloca em uma lista para ser resolvida (Future)
Future<List<ListaData>> getListaEspera() async {
  var response = await http.get(
      Uri.parse("https://www.slmm.com.br/CTC/getLista.php"),
      headers: {"Accept": "application/json"});

  if (response.statusCode != 200) throw Exception('Erro inesperado...');

  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((data) => ListaData.fromJson(data)).toList();
}

// deletar uma pessoa da lista por id
Future<String> deletarPessoaById(int id) async {
  var response = await http.delete(
      Uri.parse("https://www.slmm.com.br/CTC/delete.php?id=$id"),
      headers: {"Content-Type": "application/json"},
      body: id);
  if (response.statusCode != 200) throw Exception('Erro inesperado...');

  return response.body; //json.decode(response.body);
}

// deletar uma pessoa da lista por id
Future<String> deletarPessoaByName(String nome) async {
  var response = await http.delete(
      Uri.parse("https://www.slmm.com.br/CTC/delete.php?nome=$nome"),
      headers: {"Content-Type": "application/json"});
  if (response.statusCode != 200) throw Exception('Erro inesperado...');

  return response.body; //json.decode(response.body);
}

// puxa dados da api e os coloca em uma lista para ser resolvida (Future)

class ListaEspera extends StatefulWidget {
  const ListaEspera({Key? key}) : super(key: key);

  @override
  _ListaEsperaState createState() => _ListaEsperaState();
}

class _ListaEsperaState extends State<ListaEspera> {
  late Future<List<ListaData>> futureLista;
  List<String> emojis = [
    '🤔',
    '😎',
    '😡',
    '😍',
    '😂',
    '😭',
    '😱',
    '😘',
    '😜',
    '😝',
    '😳',
    '😛'
  ];

  @override
  void initState() {
    super.initState();
    futureLista = getListaEspera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 104, 20, 156),
          title: const Text("Lista de Espera"),
          centerTitle: mounted,
        ),
        body: Container(
          padding:
              const EdgeInsets.only(bottom: 3, top: 5, left: 10, right: 10),
          child: FutureBuilder<List<ListaData>>(
              future: futureLista,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ListaData> data = snapshot.data!;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        String nome = data[index].nome!;
                        String primeiraLetra =
                            nome.substring(0, 1).toUpperCase();
                        nome = primeiraLetra + nome.substring(1, nome.length);
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 3, top: 5, left: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                  child: ListTile(
                                shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  side: const BorderSide(width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                leading: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 53, 13, 77),
                                  child: Text(
                                    primeiraLetra,
                                    style: const TextStyle(
                                      textBaseline: TextBaseline.alphabetic,
                                      color: Colors.yellow,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // text
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                title: Text(
                                  'GabsLover $nome',
                                ),
                                subtitle: Text(
                                    'Me sentindo:${emojis[Random().nextInt(emojis.length)]}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit,
                                            color: Colors.purple.shade200
                                                .withOpacity(0.8))),
                                    IconButton(
                                        onPressed: () {
                                          deletarPessoaById(data[index].id!);
                                          setState(() {
                                            futureLista = getListaEspera();
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // by default
                return const CircularProgressIndicator();
              }),
        ));
  }
}
