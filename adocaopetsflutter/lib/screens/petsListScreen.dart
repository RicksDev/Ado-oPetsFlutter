import 'package:adocaopetsflutter/screens/Pets.dart';
import 'package:adocaopetsflutter/screens/petsDetailsScreen.dart';
import 'package:flutter/material.dart';


final List<Pet> pets = [
  
 Pet(
    name: "Samantha",
    image: 'assets/img/pet_image.png',
    location: "Cotia(2.5 km)",
    sex: "Femêa",
    color: "Bege",
    breed: "Golden",
    weight: 12.0,
    description: "Cachorro que ama água e muito amoroso",
  ),
  Pet(
      name: 'Caramelo',
      image: 'assets/img/caramelo.png',
      location: 'São Paulo (8.9Km)',
      sex: 'Macho',
      color: 'Caramelo',
      breed: 'Labrador mestiço',
      weight: 4,
      description: 'Caramelo doido para distribuir amor por ai'),
  Pet(
    name: "Samantha",
    image: 'assets/img/pet_image.png',
    location: "Cotia(2.5 km)",
    sex: "Femêa",
    color: "Bege",
    breed: "Golden",
    weight: 12.0,
    description: "Cachorro que ama água e muito amoroso",
  ),
  Pet(
      name: 'Caramelo',
      image: 'assets/img/caramelo.png',
      location: 'São Paulo (8.9Km)',
      sex: 'Macho',
      color: 'Caramelo',
      breed: 'Labrador mestiço',
      weight: 4,
      description: 'Caramelo doido para distribuir amor por ai'),
  // Outros pets...
];

class PetsListScreen extends StatelessWidget {
  const PetsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pets Disponíveis')),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final pet = pets[index];
          return GestureDetector(
            onTap: () {
              // Navega para a página de detalhes do pet ao clicar no card
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetDetailScreen(pet: pet),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        pet.image,
                        fit: BoxFit.contain,
                        width: 120,
                        height: 120,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pet.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${pet.breed} | ${pet.sex}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            pet.location,
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
