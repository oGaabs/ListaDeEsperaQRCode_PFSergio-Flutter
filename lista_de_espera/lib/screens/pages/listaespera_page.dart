import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:lista_de_espera/models/lista_data.dart';
import 'package:lista_de_espera/screens/pages/pessoa_screen.dart';
import 'package:lista_de_espera/screens/qrcode_screen.dart';

// deletar uma pessoa da lista por id
/*Future<String> deletarPessoaByName(String nome) async {
  var response = await http.delete(
      Uri.parse("https://www.slmm.com.br/CTC/delete.php?nome=$nome"),
      headers: headerOnlyJson);
  if (response.statusCode != 200) throw Exception('Erro inesperado...');

  return response.body; //json.decode(response.body);
}*/

class ListaEspera extends StatefulWidget {
  final String qrCode;
  ListaEspera(this.qrCode, {Key? key}) : super(key: key);

  @override
  _ListaEsperaState createState() => _ListaEsperaState();
}

class _ListaEsperaState extends State<ListaEspera> {
  late Future<PessoaData> futurePessoa;
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
  Widget build(BuildContext context) {
    String url = widget.qrCode;

    Map<String, String> headerOnlyJson = {
      "Content-Type": "application/json; charset=UTF-8"
    };

// puxa dados da api e os coloca em uma lista para ser resolvida (Future)
    Future<List<PessoaData>> getListaEspera() async {
      var response = await http.get(
          Uri.parse(url + "getLista.php"),
          headers: headerOnlyJson);

      if (response.statusCode != 200) throw Exception('Erro inesperado...');

      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => PessoaData.fromJson(data)).toList();
    }

// deletar uma pessoa da lista por id
    Future<String> deletarPessoaById(String id) async {
      var response = await http.delete(
          Uri.parse(url + "delete.php?id=$id"),
          headers: headerOnlyJson);
      if (response.statusCode != 200) throw Exception('Erro inesperado...');

      return response.body; //json.decode(response.body);
    }

    late Future<List<PessoaData>> futureLista = getListaEspera();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 104, 20, 156),
          title: const Text("Lista de Espera"),
          centerTitle: mounted,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    futureLista = getListaEspera();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: Container(
          padding:
              const EdgeInsets.only(bottom: 3, top: 5, left: 10, right: 10),
          child: FutureBuilder<List<PessoaData>>(
              future: futureLista,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<PessoaData> data = snapshot.data!;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        String id = data[index].id!;
                        String nome = data[index].nome!;
                        String primeiraLetra =
                            nome.substring(0, 1).toUpperCase();
                        nome = primeiraLetra + nome.substring(1, nome.length);
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      PessoaScreen(id, widget.qrCode))));
                            },
                            child: Padding(
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
                                        Text('${index + 1}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10)),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          PessoaScreen(id,
                                                              widget.qrCode))));
                                            },
                                            icon: Icon(Icons.info,
                                                color: Colors.purple.shade200
                                                    .withOpacity(0.8))),
                                        IconButton(
                                            onPressed: () {
                                              snapshot.data!.removeAt(index);
                                              deletarPessoaById(id);
                                              //deletarPessoaByName(data[index].nome!);
                                              setState(() {
                                                futureLista = getListaEspera();
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Color.fromARGB(
                                                  255, 29, 29, 38),
                                            )),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ));
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
