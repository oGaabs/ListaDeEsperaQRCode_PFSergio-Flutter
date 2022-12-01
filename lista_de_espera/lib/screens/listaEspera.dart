import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// ignore: constant_identifier_names
String URL = "https://www.slmm.com.br/CTC/getLista.php";

Future<String> fetchData() async {
  Map data = {'id': '200', 'nome': "Gabs"};
  String body = json.encode(data);

  var response = await http.post(Uri.parse(URL),
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode != 200) throw Exception('Erro inesperado...');

  return response.body; //json.decode(response.body);
}

class PostFoto extends StatefulWidget {
  const PostFoto({Key? key}) : super(key: key);

  @override
  _PostFotoState createState() => _PostFotoState();
}

class _PostFotoState extends State<PostFoto> {
  final idController = TextEditingController();
  Future<String>? _dadosF;

  // limpar os controles criados
  @override
  void dispose() {
    idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Post de dados")),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
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
                        content: Text(idController.text),
                      );
                    },
                  );
                }),
                child: Text("Enviar"))
          ]),
        ));
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: idController,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _dadosF = fetchData();
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
