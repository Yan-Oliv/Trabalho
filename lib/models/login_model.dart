import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, String>?> loadSavedLoginLocally() async {
  final prefs = await SharedPreferences.getInstance();
  final email = prefs.getString('email');
  final password = prefs.getString('password');
  if (email != null && password != null) {
    return {'email': email, 'password': password};
  }
  return null;
}

Future<void> saveLoginLocally(String email, String password) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
  await prefs.setString('password', password);
}

Future<void> clearSavedLogin() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('email');
  await prefs.remove('password');
}

Future<Map<String, dynamic>?> loginUser(String email, String password) async {
  // Aqui você deve usar sua lógica para conectar-se ao banco de dados e validar o login
  // Para fins de exemplo, substituiremos por um login simulado
  await Future.delayed(const Duration(seconds: 2)); // Simula um delay de rede

  if (email == 'yan@ciacat.com' && password == 'Test01001*') {
    return {
      'id': 1,
      'name': 'Yan',
      'role': 'Administrador',
      'firstLogin': 0,
    };
  } else if (email == 'eder@ciacat.com' && password == '12345') {
    return {
      'id': 2,
      'name': 'Edinho',
      'role': 'Usuário comum',
      'firstLogin': 1,
    };
  }

  return null; // Caso o login seja inválido
}

Future<void> changePassword(int userId, String newPassword) async {
  // Lógica para alterar a senha no banco de dados
  await Future.delayed(
      const Duration(seconds: 1)); // Simula uma alteração no banco de dados
}
