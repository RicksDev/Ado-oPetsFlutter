import 'package:adocaopetsflutter/screens/sucessScren.dart';
import 'package:flutter/material.dart';

class User {
  final String nome;
  final String senha;

  User(this.nome, this.senha);
}
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final List<User> _usuarios = []; // Armazenar usuários

  @override
  void initState() {
    super.initState();
    // Adicione alguns usuários de teste
    _usuarios.add(User('testuser', 'testpassword'));
  }

  void _login() {
    final nome = _nomeController.text;
    final senha = _senhaController.text;

    for (var usuario in _usuarios) {
      if (usuario.nome == nome && usuario.senha == senha) {
        // Navega para a próxima página após login bem-sucedido
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SuccessScreen()),
        );
        return;
      }
    }

    // Se não encontrar um usuário correspondente
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Usuário ou senha incorretos!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

