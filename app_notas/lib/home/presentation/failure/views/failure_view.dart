import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ErrorView(),
    debugShowCheckedModeBanner: false,
  ));
}

class ErrorView  extends StatelessWidget {
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
            
              Icon(
                Icons.error_outline,
                color: const Color.fromARGB(255, 44, 247, 4),
                size: 100,
              ),
              SizedBox(height: 30),
              
              Text(
                '¡Ups! Algo salió mal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 45, 253, 4),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              
              Text(
                'Ocurrió un error inesperado al cargar los datos.\nPor favor, intenta de nuevo.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              
              ElevatedButton.icon(
                onPressed: () {
                },
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
