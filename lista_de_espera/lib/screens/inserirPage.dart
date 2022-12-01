import 'package:flutter/material.dart';

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
        appBar: AppBar(title: Text("Post de dados")),
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              //ra

              TextField(
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
                  child: Text("Enviar")),

              //latitude

              TextField(
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
                  child: Text("Enviar")),

              //longitude

              TextField(
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
                  child: Text("Enviar")),

              //foto

              TextField(
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
                  child: Text("Enviar"))
            ],
          ),
        ));
  }
}
