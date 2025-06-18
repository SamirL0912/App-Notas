import 'package:flutter/material.dart';

class DataView extends StatelessWidget {
  const DataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Nota')),
      body: const Center(child: Text('Aquí podrás agregar una nota')),
    );
  }
}
