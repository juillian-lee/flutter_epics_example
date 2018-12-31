

class UserInfo {
  int id;
  String nome;
  String login;
  String email;
  String avatar;

  UserInfo({this.id, this.nome, this.login, this.email, this.avatar});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
        id: json["id"],
        nome: json["nome"],
        login: json["login"],
        email: json["email"],
        avatar: json["avatar"],
    );
  }


  @override
  String toString() {
    return "id: $id, nome: $nome, login: $login, email: $email";
  }
}