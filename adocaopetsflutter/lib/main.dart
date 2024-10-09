import 'package:adocaopetsflutter/Widgets/loginWidget.dart';
import 'package:adocaopetsflutter/screens/adoptedPetsScreen.dart';
import 'package:adocaopetsflutter/screens/dashboardScreen.dart';
import 'package:flutter/material.dart';

String? registeredName;
String? registeredPassword;
bool isLoggedIn = false;

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
        '/login': (context) => LoginWidget(
              registeredName: registeredName,
              registeredPassword: registeredPassword,
              onLoginSuccess: () {
                isLoggedIn = true;
                Navigator.pushReplacementNamed(context, '/adoptedPets');
              },
            ),
        '/adoptedPets': (context) => const AdoptedPetsScreen(),
      },
    );
  }
}
