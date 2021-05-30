class ProductDto {
  String? id;
  String? codigo;
  String? descricao;
  String? preco;
  String? entrada;
  String? saida;

  ProductDto(
      {this.id,
      this.codigo,
      this.descricao,
      this.preco,
      this.entrada,
      this.saida});

  ProductDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    descricao = json['descricao'];
    preco = json['preco'];
    entrada = json['entrada'];
    saida = json['saida'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['codigo'] = this.codigo;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['entrada'] = this.entrada;
    data['saida'] = this.saida;
    return data;
  }
}
