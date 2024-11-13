class User {
  final String name;
  final String email;
  final String phone;
  final bool isAdmin;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.isAdmin,
  });

  // Método para criar uma instância de User a partir de um JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      isAdmin: json['isAdmin'] ?? false, // Usa `false` se o campo for nulo
    );
  }

  // Método para converter uma instância de User para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'isAdmin': isAdmin,
    };
  }
}
