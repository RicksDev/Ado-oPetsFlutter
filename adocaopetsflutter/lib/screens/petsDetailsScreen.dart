import 'package:adocaopetsflutter/model/pet.dart';
import 'package:flutter/material.dart';
// Corrija o caminho de importação conforme a estrutura do seu projeto

// Lista global para salvar os pets "adotados"
List<Pets> adoptedPets = [];

class PetDetailScreen extends StatelessWidget {
  final Pets pet;

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
          SizedBox(
            height: 250,
            child: PageView.builder(
              itemCount: pet.imageUrls.length, // Conta o número de imagens
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          pet.imageUrls[index]), // Usa a imagem do array
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),
          // Nome do Pet e Preço
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    pet.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
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
              pet.age,
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
                    Text(pet.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Name'),
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
                    Text('${pet.weight}kg',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Peso'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Botão Adotar
          Column(
            children: [
              const SizedBox(height: 150), // Espaço extra acima do botão
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Adiciona o pet à lista de adotados
                    adoptedPets.add(pet);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Pet adicionado à lista de "Me Adote"!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 25),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Me adote!'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
