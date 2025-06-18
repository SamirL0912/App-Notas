import 'package:flutter/material.dart';

class NotaNuevaScreen extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 255, 255, 255),
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.style, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _tituloController,
              style: TextStyle(fontSize: 24, color: Colors.black87),
              decoration: InputDecoration(
                hintText: 'Título',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 4),

            TextField(
              controller: _contenidoController,
              maxLines: null,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Empieza a escribir',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              onChanged: (text) {
                // Puedes actualizar el contador de caracteres si deseas
              },
            ),
            SizedBox(height: 12),
          
          ],
        ),
      ),
    );
  }
}