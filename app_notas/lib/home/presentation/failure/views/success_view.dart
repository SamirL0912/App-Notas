import 'package:app_notas/models/model_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessView extends StatefulWidget {
  final User user;

  const SuccessView({super.key, required this.user});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  final Color green = const Color.fromARGB(255, 234, 255, 235);
  final Color peach = const Color.fromARGB(255, 255, 213, 204);
  final Color blue = const Color.fromARGB(255, 214, 233, 255);
  final Color beige = const Color.fromARGB(255, 248, 241, 220);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFEFE),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'NoteBook de ${widget.user.username}',
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
              icon: const Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, '/data_view');
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.black26,
            indicatorWeight: 3,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [Tab(text: 'Todo'), Tab(text: 'Importantes')],
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
                          'Hola ${widget.user.username}, estas son tus notas',
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
                    noteItem(Icons.work, green,"Work","informe de trabajo", green),
                    const SizedBox(height: 12),
                    noteItem(Icons.favorite, peach,"Personal","recomendaciones de libros", peach),
                    const SizedBox(height: 12),
                    noteItem(Icons.lightbulb, blue,"Ideas","manualidades", blue),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        categoryBox('Ideas', blue, Icons.lightbulb),
                        const SizedBox(width: 8),
                        categoryBox('Recipes', beige, Icons.restaurant),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        categoryBox('Work', green, Icons.work),
                        const SizedBox(width: 8),
                        categoryBox('Personal', peach, Icons.favorite),
                      ],
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 149, 224, 149),
                  onPressed: () {
                    Navigator.pushNamed(context, '/data_view');
                  },
                  child: const Icon(Icons.add, color: Colors.white),
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
      padding: const EdgeInsets.symmetric(horizontal: 12),
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

  Widget noteItem(IconData icon, Color color, String text,String title, Color titleColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: color),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      color: titleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Icon(Icons.edit, size: 20, color: Colors.grey),
            ], 
          ),
         Text(
            text,
            style: GoogleFonts.roboto(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
