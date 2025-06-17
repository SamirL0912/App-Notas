import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Success extends StatelessWidget {
  final Color green = Color.fromARGB(255, 234, 255, 235);
  final Color peach = Color.fromARGB(255, 255, 213, 204);
  final Color blue = Color.fromARGB(255, 214, 233, 255);
  final Color beige = Color.fromARGB(255, 248, 241, 220);

  Success({super.key});

  @override
  Widget build(BuildContext context) {
    return success();
  }

  DefaultTabController success() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFEFE),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'NoteBook',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: const Color(0xFFFFFEFE),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.black26,
            indicatorWeight: 3,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Todo'),
              Tab(text: 'Importantes'),
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Últimas notas',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Ver todo',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    noteItem(Icons.work, green),
                    SizedBox(height: 12),
                    noteItem(Icons.favorite, peach),
                    SizedBox(height: 12),
                    noteItem(Icons.lightbulb, blue),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        categoryBox('Ideas', blue, Icons.lightbulb),
                        SizedBox(width: 8),
                        categoryBox('Recipes', beige, Icons.restaurant),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        categoryBox('Work', green, Icons.work),
                        SizedBox(width: 8),
                        categoryBox('Personal', peach, Icons.favorite),
                      ],
                    ),
                    SizedBox(height: 120), // Espacio extra para no tapar con el botón
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30, // << Ajusta la altura aquí
              left: 0,
              right: 0,
              child: Center(
                child: FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 149, 224, 149),
                  onPressed: () {},
                  child: Icon(Icons.add, color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryBox(String label, Color color, IconData icon) {
    return Container(
      width: 160,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(icon, color: Colors.black54),
        ],
      ),
    );
  }

  Widget noteItem(IconData icon, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 26),
          SizedBox(width: 16),
          Spacer(),
          Icon(Icons.edit, size: 20, color: Colors.grey),
        ],
      ),
    );
  }
}
