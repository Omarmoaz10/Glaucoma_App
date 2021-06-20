class User {
  final String id;
  final String f_name;
  final String l_name;
  final String email;
  final String password;

  User({
    this.id,
    this.f_name,
    this.l_name,
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      f_name: json['f_name'],
      l_name: json['l_name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'f_name': f_name,
        'l_name': l_name,
        'email': email,
        'password': password,
      };
}
