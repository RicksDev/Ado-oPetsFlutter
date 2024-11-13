class Pets {
  final String name;
  final String age;
  final double weight;
  final String color;
  final List<String> imageUrls;

  Pets({
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.imageUrls,
  });

  // Método para criar uma instância de Pets a partir de um JSON
  factory Pets.fromJson(Map<String, dynamic> json) {
    return Pets(
      name: json['name'],
      age: json['age'],
      weight: json['weight'].toDouble(), // Garante que é double
      color: json['color'],
      imageUrls: json['imageUrls'] != null
          ? List<String>.from(json['imageUrls'])
          : [], // Se 'imageUrls' for null, atribui uma lista vazia
    );
  }

  // Método para converter uma instância de Pets para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'color': color,
      'imageUrls': imageUrls,
    };
  }
}
