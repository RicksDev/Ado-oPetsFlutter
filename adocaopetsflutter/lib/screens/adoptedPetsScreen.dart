// import 'package:adocaopetsflutter/screens/petsDetailsScreen.dart';
// import 'package:flutter/material.dart';

// class AdoptedPetsScreen extends StatelessWidget {
//   const AdoptedPetsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Meus Pets Adotados')),
//       body: adoptedPets.isEmpty
//           ? const Center(child: Text('Nenhum pet adotado ainda.'))
//           : ListView.builder(
//               itemCount: adoptedPets.length,
//               itemBuilder: (context, index) {
//                 final pet = adoptedPets[index];
//                 return ListTile(
//                   leading: // Carrossel de Imagens
//                       SizedBox(
//                     height: 250,
//                     child: PageView.builder(
//                       itemCount: pet.images.length,
//                       itemBuilder: (context, index) {
//                         return Image.network(
//                           pet.images[
//                               index], // Acessa cada URL individualmente
//                           fit: BoxFit.cover,
//                         );
//                       },
//                     ),
//                   ),
//                   title: Text(pet.name),
//                   subtitle: Text('${pet.age} | ${pet.color}'),
//                 );
//               },
//             ),
//     );
//   }
// }

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
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: pet.images.isNotEmpty
                        ? Image.network(
                            pet.images.first, // Mostra apenas a primeira imagem
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          )
                        : const Icon(Icons.pets, size: 50),
                    title: Text(pet.name),
                    subtitle: Text('Idade: ${pet.age} | Cor: ${pet.color}'),
                    onTap: () {
                      // Exibe os detalhes do pet adotado
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PetDetailScreen(pet: pet), // Reutiliza a tela de detalhes
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
