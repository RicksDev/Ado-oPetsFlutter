import 'package:adocaopetsflutter/Widgets/cadastroWidget.dart';
import 'package:adocaopetsflutter/Widgets/loginWidget.dart';
import 'package:flutter/material.dart';
import 'petsListScreen.dart';


String? registeredName;
String? registeredPassword;
bool isLoggedIn = false; // Variável global para controlar o estado do login

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Adoção do Ricks'),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: const Text(
              'Bem-vindo à Adoção do Ricks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/img/Rectangle.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              isLoggedIn
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PetsListScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Pets'),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        // Puxa o widget de Login ao invés de uma tela
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: const Text('Login'),
                                backgroundColor: Colors.orange,
                              ),
                              body: LoginWidget(
                                registeredName: registeredName,
                                registeredPassword: registeredPassword,
                                onLoginSuccess: () {
                                  setState(() {
                                    isLoggedIn = true; // Define o estado como logado
                                  });
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
              ElevatedButton(
                onPressed: () {
                  // Puxa o widget de Cadastro ao invés de uma tela
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: const Text('Cadastro'),
                          backgroundColor: Colors.orange,
                        ),
                        body: CadastroWidget(
                          onCadastroSuccess: (name, password) {
                            setState(() {
                              registeredName = name;
                              registeredPassword = password;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Cadastro'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
