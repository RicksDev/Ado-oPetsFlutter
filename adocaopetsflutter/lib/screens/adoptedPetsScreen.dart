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
                  leading: Image.asset(pet.image, width: 50, height: 50),
                  title: Text(pet.name),
                  subtitle: Text('${pet.breed} | ${pet.sex}'),
                );
              },
            ),
    );
  }
}
