class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  DateTime? dateNaissance;
  String? token;

  User(
      {this.id,
      this.name,
      this.email,
      this.token,
      this.dateNaissance,
      this.phoneNumber
      });

  // function to convert json data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'],
        name: json['user']['name'],
        email: json['user']['email'],
        phoneNumber: json['user']['phoneNumber'],
        dateNaissance: json['user']['dateNaissance'],
        token: json['token']);
  }
}
