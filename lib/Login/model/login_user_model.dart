class LoginUser {
  final String name;
  final String email;

  LoginUser({required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
