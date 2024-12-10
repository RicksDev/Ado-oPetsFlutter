// import 'package:adocaopetsflutter/model/pet.dart';
// import 'package:flutter/material.dart';

// class PetsListController {
//   final List<Pets> pets = [
//     Pets(
//       name: "Samantha",
//       age: '2',
//       weight:10,
//       color: 'Caramelo',
//       imageUrls:[ 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png','https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png', 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png']
//     ),
//     Pets(
//       name: 'Caramelo',
//       age: '5',
//       weight: 15,
//       color: "Preto",
//       imageUrls:[ 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png', 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png', 'https://cdn.pixabay.com/photo/2018/08/16/20/01/rhodesian-ridgeback-3611294_1280.png']
//     ),
//     // Outros pets...
//   ];

//   int selectedIndex = 0;

//   void onItemTapped(BuildContext context, int index) {
//     selectedIndex = index;

//     if (index == 0) {
//       Navigator.pushNamed(context, '/adoptedPets');
//     } else if (index == 1) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Na Adoção de Pets do Ricks, acreditamos que cada animal merece uma segunda chance. Nossa missão é conectar corações e lares a peludos que estão à espera de um novo começo. Os pets que resgatamos vêm de diversas histórias, mas todos têm algo em comum: a vontade de amar e serem amados."),
//         ),
//       );
//     }
//   }
// }
import 'dart:convert';
import 'package:adocaopetsflutter/model/pet.dart';
import 'package:adocaopetsflutter/screens/adoptedPetsScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PetsListController {
  List<Pets> pets = []; // Lista de pets mutável para ser preenchida pela API
  int selectedIndex = 0;

  // Função para buscar dados da API
  Future<void> fetchPets() async {
    const url = 'https://pet-adopt-dq32j.ondigitalocean.app/pet/pets';

    try {
      final response = await http.get(Uri.parse(url));
      debugPrint('Status Code: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print("=--===========================");
        print(data["pets"]);
        var allData = data["pets"];

         allData.forEach((json) {
          print(json);
          pets.add(Pets.fromJson(json));
        });

        debugPrint('Pets atribuídos: $pets');
      } else {
        debugPrint('Erro ao carregar os pets: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erro ao buscar pets: $e');
    }
  }

  // Função para navegação
  // void onItemTapped(BuildContext context, int index) {
  //   selectedIndex = index;

  //   if (index == 0) {
  //     Navigator.pushNamed(context, '/adoptedPets');
  //   } else if (index == 1) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text(
  //             "Na Adoção de Pets do Ricks, acreditamos que cada animal merece uma segunda chance. Nossa missão é conectar corações e lares a peludos que estão à espera de um novo começo. Os pets que resgatamos vêm de diversas histórias, mas todos têm algo em comum: a vontade de amar e serem amados."),
  //       ),
  //     );
  //   }
  // }

  void onItemTapped(BuildContext context, int index) {
  selectedIndex = index;

    

  if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AdoptedPetsScreen(),
      ),
    );
  } else if (index == 1) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Na Adoção de Pets do Ricks, acreditamos que cada animal merece uma segunda chance. Nossa missão é conectar corações e lares a peludos que estão à espera de um novo começo. Os pets que resgatamos vêm de diversas histórias, mas todos têm algo em comum: a vontade de amar e serem amados.",
        ),
      ),
    );
  }
}

}
