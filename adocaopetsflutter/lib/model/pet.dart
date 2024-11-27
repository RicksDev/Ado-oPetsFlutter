// class Pets {
//   final String name;
//   final String age;
//   final double weight;
//   final String color;
//   final List<String> imageUrls;

//   Pets({
//     required this.name,
//     required this.age,
//     required this.weight,
//     required this.color,
//     required this.imageUrls,
//   });

//   // Método para criar uma instância de Pets a partir de um JSON
//   factory Pets.fromJson(Map<String, dynamic> json) {
//     return Pets(
//       name: json['name'],
//       age: json['age'],
//       weight: json['weight'].toDouble(), // Garante que é double
//       color: json['color'],
//       imageUrls: json['imageUrls'] != null
//           ? List<String>.from(json['imageUrls'])
//           : [], // Se 'imageUrls' for null, atribui uma lista vazia
//     );
//   }

//   // Método para converter uma instância de Pets para JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'age': age,
//       'weight': weight,
//       'color': color,
//       'imageUrls': imageUrls,
//     };
//   }
// }
class Pets {
  final String name;
  final int age;
  final double weight;
  final String color;
  final List<String> images;

  Pets({
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.images,
  });

  // Método para criar uma instância de Pets a partir de um JSON
  factory Pets.fromJson(Map<String, dynamic> json) {
    return Pets(
      name: json['name'] ?? 'Desconhecido', // Adiciona um valor padrão
      age: json['age'] ?? '0', // Adiciona um valor padrão para idade
      weight: (json['weight'] as num).toDouble(), // Garante que é double
      color: json['color'] ?? 'Desconhecido', // Adiciona um valor padrão para cor
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : [], // Se 'images' for null, atribui uma lista vazia
    );
  }

  // Método para converter uma instância de Pets para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'color': color,
      'images': images,
    };
  }
}
