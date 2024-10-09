import 'package:adocaopetsflutter/screens/adoptedPetsScreen.dart';
import 'package:adocaopetsflutter/screens/dashboardScreen.dart';
import 'package:adocaopetsflutter/screens/loginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
         routes: {
      '/adoptedPets': (context) => const AdoptedPetsScreen(),
    },
    );
  }
}


