import 'package:flutter/material.dart';
import 'package:app_notas/home/presentation/failure/views/failure_view.dart';
import 'package:app_notas/home/presentation/failure/views/initial_view.dart';
import 'package:app_notas/home/presentation/failure/views/loading_view.dart';
import 'package:app_notas/home/presentation/failure/views/success_view.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback onRetry;

  ErrorView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Color.fromARGB(255, 44, 247, 4), size: 100),
              SizedBox(height: 30),
              Text('¡Ups! Algo salió mal',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 45, 253, 4),
                  ),
                  textAlign: TextAlign.center),
              SizedBox(height: 12),
              Text(
                'Ocurrió un error inesperado al cargar los datos.\nPor favor, intenta de nuevo.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: Icon(Icons.refresh),
                label: Text('Reintentar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  LoginView({required this.onLoginSuccess});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _error;

  void _login() {
    final user = _userController.text.trim();
    final password = _passwordController.text.trim();


    if (user == 'admin' && password == '123456') {
      widget.onLoginSuccess();
    } else {
      setState(() {
        _error = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.book, size: 60, color: Colors.blueAccent),
              SizedBox(height: 16),
              Text('Iniciar Sesión', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              TextField(
                controller: _userController,
                decoration: InputDecoration(
                  labelText: 'Nombre de usuario',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              if (_error != null) ...[
                SizedBox(height: 12),
                Text(_error!, style: TextStyle(color: Colors.red)),
              ],
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 12, 248, 4),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('Ingresar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  final String imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLITBesD2WSLyM0gUXN6S7Ft4kYbWnNi85xw&s';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(imageUrl, height: 100, width: 100),
          SizedBox(height: 20),
          Text('Cargando...', style: TextStyle(fontSize: 16, color: Colors.black)),
        ]),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  final VoidCallback onLogout;

  HomeView({required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: onLogout),
        ],
      ),
      body: Center(child: Text('Contenido cargado')),
    );
  }
}

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Éxito')),
      body: Center(child: Text('Operación exitosa')),
    );
  }
}

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

enum AppStatus { login, loading, home, error }

class _MainAppState extends State<MainApp> {
  AppStatus _status = AppStatus.login;

  void _tryLogin() {
    setState(() => _status = AppStatus.loading);

    Future.delayed(Duration(seconds: 2), () {
    
      setState(() => _status = AppStatus.home);
    });
  }

  void _logout() {
    setState(() => _status = AppStatus.login);
  }

  void _retry() {
    setState(() => _status = AppStatus.login);
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (_status) {
      case AppStatus.login:
        body = LoginView(onLoginSuccess: _tryLogin);
        break;
      case AppStatus.loading:
        body = LoadingView();
        break;
      case AppStatus.home:
        body = HomeView(onLogout: _logout);
        break;
      case AppStatus.error:
        body = ErrorView(onRetry: _retry);
        break;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: body,
    );
  }
}
