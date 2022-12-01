import 'package:flutter/material.dart';

class CadastroNome extends StatelessWidget {
  return Scaffold(
    //barrinha de cima
    appBar: AppBar(
      title: Text('Cadastro dos nomes'),
      actions: <Widget>[
        Button(
          text: Text('Salvar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        
      ],
    ),
    //body
    body: Padding(
      padding: EdgeInserts.all(10),
      child: Form(
        child: Column(
          children: <Widget>[
            // input nome
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            // hora??
            DateFormat(
              
            )
          ]
        )
      )
    )

  );
}