import 'package:flutter/material.dart';
import 'package:app_notas/home/presentation/failure/views/failure_view.dart';
import 'package:app_notas/home/presentation/failure/views/loading_view.dart';
import 'package:app_notas/home/presentation/failure/views/initial_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginView (),
    );
  }
}
