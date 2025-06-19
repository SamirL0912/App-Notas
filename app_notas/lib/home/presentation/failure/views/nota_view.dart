import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_notas/models/model_nota.dart';
import 'package:app_notas/bloc/notas_bloc.dart';

class NotaNuevaScreen extends StatefulWidget {
  const NotaNuevaScreen({super.key});

  @override
  State<NotaNuevaScreen> createState() => _NotaNuevaScreenState();
}

class _NotaNuevaScreenState extends State<NotaNuevaScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.green),
            onPressed: () {
              final titulo = _tituloController.text.trim();
              final contenido = _contenidoController.text.trim();

              if (titulo.isNotEmpty && contenido.isNotEmpty) {
                final nuevaNota = Nota(titulo: titulo, contenido: contenido);
                context.read<NotasBloc>().add(AgregarNota(nuevaNota));
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Completa todos los campos')),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              style: const TextStyle(fontSize: 24, color: Colors.black87),
              decoration: const InputDecoration(
                hintText: 'Título',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _contenidoController,
              maxLines: null,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: 'Empieza a escribir',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
