import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isLoading = true; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoading ? LoadingView() : HomeView(),
      debugShowCheckedModeBanner: false,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            SizedBox(height: 10),
            Text(
              'Cargando...',
              style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 5, 5, 5)),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(child: Text('Contenido cargado')),
    );
  }
}
