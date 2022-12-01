class ListaData {
  int? id;
  String? nome;

  ListaData({this.id, this.nome});

  ListaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return '{${this.id}, ${this.nome}';
  }
}
