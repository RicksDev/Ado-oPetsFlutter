import 'package:adocaopetsflutter/screens/Pets.dart';
import 'package:flutter/material.dart';

class PetDetailScreen extends StatelessWidget {
  final Pet pet;

  const PetDetailScreen({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pet'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Imagem do Pet
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(pet.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Nome do Pet e Preço
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza a Row
              children: [
                Expanded(
                  // Faz com que o Text ocupe toda a largura disponível
                  child: Text(
                    pet.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign
                        .center, // Centraliza o texto dentro do espaço disponível
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          // Localização
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              pet.location,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Informações do Pet
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(pet.sex,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Sexo'),
                  ],
                ),
                Column(
                  children: [
                    Text(pet.color,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Cor'),
                  ],
                ),
                Column(
                  children: [
                    Text(pet.breed,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Raça'),
                  ],
                ),
                Column(
                  children: [
                    Text('${pet.weight}kg',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Peso'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Descrição
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              pet.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 8),

          // Botão Adotar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                // Ação do botão
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Me adote!'),
            ),
          ),
        ],
      ),
    );
  }
}
