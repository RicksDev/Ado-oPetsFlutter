import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sucesso'),
        centerTitle: true,
      ),
      body: Center(
        child: const Text(
          'Login realizado com sucesso!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}









