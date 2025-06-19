import 'package:app_notas/bloc/home_bloc.dart';
import 'package:app_notas/bloc/notas_bloc.dart';
import 'package:app_notas/home/presentation/failure/views/initial_view.dart';
import 'package:app_notas/home/presentation/failure/views/nota_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const NotasApp());
}

class NotasApp extends StatelessWidget {
  const NotasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => NotasBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App de Notas',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginView(),
          '/data_view': (context) => NotaNuevaScreen(),
        },
      ),
    );
  }
}
