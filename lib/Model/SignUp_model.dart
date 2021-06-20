class SignUp {
  final String f_name;
  final String l_name;
  final String email;
  final String password;

  SignUp(this.f_name, this.l_name, this.email, this.password);

  SignUp.fromJson(Map<String, dynamic> json)
      : f_name = json['fname'],
        l_name = json['lname'],
        email = json['email'],
        password = json['password'];
}
