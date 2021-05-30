class UserDto {
  String? id;
  String? nome;
  String? login;
  String? senha;

  UserDto({
    this.id,
    this.nome,
    this.login,
    this.senha,
  });

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    login = json['login'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['login'] = this.login;
    data['senha'] = this.senha;
    return data;
  }
}
