import 'package:adocaopetsflutter/screens/petsDetailsScreen.dart';
import 'package:flutter/material.dart';

class AdoptedPetsScreen extends StatelessWidget {
  const AdoptedPetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Pets Adotados')),
      body: adoptedPets.isEmpty
          ? const Center(child: Text('Nenhum pet adotado ainda.'))
          : ListView.builder(
              itemCount: adoptedPets.length,
              itemBuilder: (context, index) {
                final pet = adoptedPets[index];
                return ListTile(
                  leading: // Carrossel de Imagens
                      SizedBox(
                    height: 250,
                    child: PageView.builder(
                      itemCount: pet.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          pet.imageUrls[
                              index], // Acessa cada URL individualmente
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  title: Text(pet.name),
                  subtitle: Text('${pet.age} | ${pet.color}'),
                );
              },
            ),
    );
  }
}
