class ListaData {
  int? id;
  String? nome;
  String? data;

  ListaData({this.id, this.nome, this.data});

  Map toJson() => {'id': id, 'nome': nome, 'data': data};

  ListaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    data = json['data'];
  }

  @override
  String toString() {
    return '{$id, $nome, $data}';
  }
}
