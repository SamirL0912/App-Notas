import 'package:app_notas/bloc/home_bloc.dart';
import 'package:app_notas/home/presentation/failure/views/failure_view.dart';
import 'package:app_notas/home/presentation/failure/views/success_view.dart';
import 'package:app_notas/home/presentation/failure/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8DC),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => LoadingView(),
            );
          } else if (state is HomeSuccess) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => SuccessView(user: state.user)),
            );
          } else if (state is HomeFailure) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => ErrorView(message: state.message),
              ),
            );
          }
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Column(
              children: [
                const Icon(Icons.note_alt, size: 80, color: Colors.brown),
                const SizedBox(height: 10),
                Text(
                  'Bloc de Notas',
                  style: GoogleFonts.permanentMarker(
                    fontSize: 32,
                    color: Colors.brown.shade700,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Usuario',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey.shade700),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey.shade700),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade400,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    final username = _usernameController.text.trim();
                    final password = _passwordController.text.trim();

                    if (username.isNotEmpty && password.isNotEmpty) {
                      context.read<HomeBloc>().add(
                        LoginSubmitted(username: username, password: password),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, completa todos los campos'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Entrar',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
