import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'package:lista_de_espera/models/lista_data.dart';

class PessoaScreen extends StatefulWidget {
  final String id;
  final String qrCode;
  const PessoaScreen(this.id, this.qrCode, {super.key});

  @override
  _PessoaScreenState createState() => _PessoaScreenState();
}

class _PessoaScreenState extends State<PessoaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 104, 20, 156),
          title: const Text("Informações da Pessoa na fila"),
          centerTitle: mounted,
        ),
        body: buildForm());
  }

  Widget buildForm() {
    Map<String, String> headerOnlyJson = {
      "Content-Type": "application/json; charset=UTF-8"
    };

// pegar usuario pelo id
    Future<PessoaData> getPessoaPeloId(String id) async {
      var response = await http.get(
          Uri.parse("https://www.slmm.com.br/CTC/getDetalhe.php?id=$id"),
          headers: headerOnlyJson);

      if (response.statusCode != 200) throw Exception('Erro inesperado...');
      // get id from response
      final Map person = json.decode(response.body)[0];

      return PessoaData(
          id: person["id"].toString(),
          nome: person["nome"],
          data: person["data"]);
    }

    Future<PessoaData> pessoaF = getPessoaPeloId(widget.id);
    return Container(
        padding: const EdgeInsets.all(5),
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(5),
            child: FutureBuilder<PessoaData>(
                future: pessoaF,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    PessoaData data = snapshot.data!;
                    // tempo na fila
                    DateTime entradaNaFila =
                        DateTime.parse(data.data!); // data de entrada na fila
                    DateTime agora = DateTime.now(); // data atual
                    Duration durTempoNaFila = agora
                        .difference(entradaNaFila); // diferença entre as datas

                    String tempoNaFila = DateFormat('HH:mm:ss')
                        .format(// Converte pra string hh mm ss
                            // formata a diferença para HH:mm:ss
                            DateTime.fromMillisecondsSinceEpoch(
                                // Transforma milisegundos em data
                                durTempoNaFila.inMilliseconds,
                                isUtc: true));

                    String nome = data.nome!;
                    String primeiraLetra = nome
                        .substring(0, 1)
                        .toUpperCase(); // pega a primeira letra do nome
                    nome = primeiraLetra +
                        nome.substring(
                            1, nome.length); // primeira letra maiuscula

                    return Center(
                      child: Center(
                          child: ListTile(
                              tileColor:
                                  const Color.fromARGB(255, 208, 163, 216),
                              shape: RoundedRectangleBorder(
                                //<-- SEE HERE
                                side: const BorderSide(width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              leading: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 84, 0, 122),
                                child: Text(
                                  primeiraLetra,
                                  style: const TextStyle(
                                    textBaseline: TextBaseline.alphabetic,
                                    color: Color.fromARGB(255, 255, 208, 0),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  // text
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              title: Text(
                                'GabsLover: $nome ⭐',
                                style: const TextStyle(
                                  textBaseline: TextBaseline.alphabetic,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '⏱ Tempo na fila: $tempoNaFila',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ))),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // by default
                  return const CircularProgressIndicator();
                })));
  }
}
