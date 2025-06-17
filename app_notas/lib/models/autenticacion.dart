import 'dart:convert';
import 'package:app_notas/models/model_user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl =
      'https://run.mocky.io/v3/586957c5-3fb3-4718-a565-90d6cab95ad9';

  Future<User?> login(String username, String password) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      for (var userJson in data) {
        final user = User.fromJson(userJson);
        if (user.username == username && user.password == password) {
          return user; // Autenticado correctamente
        }
      }

      throw Exception('Credenciales incorrectas');
    } else {
      throw Exception('Error al conectar con el servidor');
    }
  }
}
