import 'package:intl/intl.dart';

class PessoaData {
  String? id;
  String? nome;
  String? data;

  PessoaData({this.id, this.nome, this.data});

  Map toJson() => {'id': id, 'nome': nome, 'data': data};
  Map toJsonInserir() => {'nome': nome, 'data': DateFormat("dd/MM/yy HH:mm:ss").format(DateTime.now())};

  factory PessoaData.fromJson(dynamic json) {
    if (json['data'] == null) {
      json['data'] = DateFormat("dd/MM/yy HH:mm:ss").format(DateTime.now());
    }
    String idPessoa = json['id'].toString();
    try {
      idPessoa = int.parse(json['id']).toString();
    } catch (e) { // IGNORE: avoid_catches_without_on_clauses
    } 

    return PessoaData(
        id:  idPessoa,
        nome: json['nome'] as String,
        data: json['data'] as String);
  }

  @override
  String toString() {
    return '{$id, $nome, $data}';
  }
}
