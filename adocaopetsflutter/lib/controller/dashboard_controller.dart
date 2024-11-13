// lib/controller/dashboard_controller.dart

import '../model/user.dart';
import '../model/pet.dart';

class DashboardController {
  User? currentUser; // Armazena o usuário logado
  List<Pets> petsList = []; // Lista de animais para adoção
  bool isLoggedIn = false;

  // Método para registrar um novo usuário
  void register(String name, String email, String phone, bool isAdmin) {
    currentUser = User(
      name: name,
      email: email,
      phone: phone,
      isAdmin: isAdmin,
    );
  }

  // Método para realizar o login
  bool login(String name, String email) {
    // Verifica se o nome e email correspondem ao usuário registrado
    if (currentUser != null && currentUser!.name == name && currentUser!.email == email) {
      isLoggedIn = true;
      return true;
    }
    return false;
  }

  // Método para deslogar
  void logout() {
    isLoggedIn = false;
    currentUser = null;
  }

  // Método para definir a lista de pets (vinda de uma API ou local)
  void setPets(List<Map<String, dynamic>> petsData) {
    petsList = petsData.map((data) => Pets.fromJson(data)).toList();
  }

  // Método para adicionar um novo pet
  void addPet(Pets pet) {
    petsList.add(pet);
  }
}
