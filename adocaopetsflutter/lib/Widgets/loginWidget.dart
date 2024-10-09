import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  final String? registeredName; // Nome registrado para validação
  final String? registeredPassword; // Senha registrada para validação
  final Function() onLoginSuccess; // Função que será chamada no sucesso do login

  const LoginWidget({
    Key? key,
    required this.registeredName,
    required this.registeredPassword,
    required this.onLoginSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Senha',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text == registeredName &&
                  _passwordController.text == registeredPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login bem-sucedido!')),
                );
                onLoginSuccess(); // Chama a função de sucesso no login
                Navigator.pop(context); // Volta para a tela anterior
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Nome ou senha incorretos!')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Entrar', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
