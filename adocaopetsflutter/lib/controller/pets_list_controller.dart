
import 'package:adocaopetsflutter/model/pet.dart';
import 'package:flutter/material.dart';

class PetsListController {
  final List<Pets> pets = [
    Pets(
      name: "Samantha",
      age: '2',
      weight:10,
      color: 'Caramelo',
      imageUrls:[ 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png','https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png', 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png']
    ),
    Pets(
      name: 'Caramelo',
      age: '5',
      weight: 15,
      color: "Preto",
      imageUrls:[ 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png', 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png', 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png']
    ),
    // Outros pets...
  ];

  int selectedIndex = 0;

  void onItemTapped(BuildContext context, int index) {
    selectedIndex = index;

    if (index == 0) {
      Navigator.pushNamed(context, '/adoptedPets');
    } else if (index == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Na Adoção de Pets do Ricks, acreditamos que cada animal merece uma segunda chance. Nossa missão é conectar corações e lares a peludos que estão à espera de um novo começo. Os pets que resgatamos vêm de diversas histórias, mas todos têm algo em comum: a vontade de amar e serem amados."),
        ),
      );
    }
  }
}
