

class User {
  int id;
  String nome;
  String login;
  String email;
  String avatar;

  User.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.nome = json["nome"];
    this.login = json["login"];
    this.email = json["email"];
    this.avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
      'login': this.login,
      'email': this.email,
      'avatar': this.avatar
    };
  }
}