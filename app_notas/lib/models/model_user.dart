class User {
  final String username;
  final int password;

  User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: int.tryParse(json['password'].toString()) ?? 0,
    );
  }
}
