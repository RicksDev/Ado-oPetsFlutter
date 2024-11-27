// import 'package:flutter/material.dart';
// import '../controller/pets_list_controller.dart';
// import 'petsDetailsScreen.dart';

// class PetsListScreen extends StatefulWidget {
//   const PetsListScreen({super.key});

//   @override
//   State<PetsListScreen> createState() => _PetsListScreenState();
// }

// class _PetsListScreenState extends State<PetsListScreen> {
//   final PetsListController controller = PetsListController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Pets Disponíveis')),
//       body: ListView.builder(
//         itemCount: controller.pets.length,
//         itemBuilder: (context, index) {
//           final pet = controller.pets[index];
//           return GestureDetector(
//             onTap: () {
//               // Navega para a página de detalhes do pet ao clicar no card
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PetDetailScreen(pet: pet),
//                 ),
//               );
//             },
//             child: Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.network(
//                         pet.imageUrls[
//                             index], // Acessando o array de imagens com o índice
//                         fit: BoxFit.contain,
//                         width: 120,
//                         height: 120,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             pet.name,
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             '${pet.age} | ${pet.color}',
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             pet.name,
//                             style: const TextStyle(
//                               color: Colors.grey,
//                               fontSize: 14,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Me Adote',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info),
//             label: 'Sobre',
//           ),
//         ],
//         currentIndex: controller.selectedIndex,
//         selectedItemColor: Colors.orange,
//         onTap: (index) {
//           setState(() {
//             controller.onItemTapped(context, index);
//           });
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../controller/pets_list_controller.dart';
import 'petsDetailsScreen.dart';

class PetsListScreen extends StatefulWidget {
  const PetsListScreen({super.key});

  @override
  State<PetsListScreen> createState() => _PetsListScreenState();
}

class _PetsListScreenState extends State<PetsListScreen> {
  final PetsListController controller = PetsListController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPets();
  }

  // Future<void> _loadPets() async {
  //   await controller.fetchPets();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  Future<void> _loadPets() async {
    await controller.fetchPets();
    debugPrint('Pets carregados: ${controller.pets}');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pets Disponíveis')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.pets.length,
              itemBuilder: (context, index) {
                final pet = controller.pets[index];
                print(pet.images[0]);
                return GestureDetector(
                  onTap: () {
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pet.images[0]),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              pet.images.isNotEmpty
                                  ? pet.images[0].toString()
                                  : '',
                              fit: BoxFit.contain,
                              width: 120,
                              height: 120,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
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
                                  '${pet.age} | ${pet.color}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  pet.name,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Me Adote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
        currentIndex: controller.selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: (index) {
          setState(() {
            controller.onItemTapped(context, index);
          });
        },
      ),
    );
  }
}
