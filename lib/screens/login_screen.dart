import 'package:flutter/material.dart';
import '../models/login_model.dart';
import 'home_screen.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cia Cat System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: Center(
            child:
                CircularProgressIndicator() // Exibe um carregamento temporário
            ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  String savedEmail = '';
  String savedPassword = '';

  @override
  void initState() {
    super.initState();
    _loadSavedLogin();
  }

  _loadSavedLogin() async {
    final loginData = await loadSavedLoginLocally();
    if (loginData != null) {
      setState(() {
        savedEmail = loginData['email'] ?? '';
        savedPassword = loginData['password'] ?? '';
        emailController.text = savedEmail;
        passwordController.text = savedPassword;
        rememberMe = true;
      });
    }
  }

  void _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    var user = await loginUser(email, password);

    if (user != null) {
      if (rememberMe) {
        saveLoginLocally(email, password);
      } else {
        clearSavedLogin();
      }

      if (user['firstLogin'] == 1 && user['role'] == 'Usuário comum') {
        _promptPasswordChange(user['id'], user['name']);
      } else {
        _loadMainApp(user['name'], user['role']);
      }
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Erro"),
          content: const Text("E-mail ou senha incorretos. Tente novamente."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  void _promptPasswordChange(int userId, String userName) async {
    String? newPassword = await showDialog<String>(
      context: context,
      builder: (context) {
        TextEditingController newPasswordController = TextEditingController();
        return AlertDialog(
          title: const Text('Alterar Senha'),
          content: TextField(
            controller: newPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Nova Senha'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null); // Cancelar
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(newPasswordController.text); // Confirmar
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (newPassword != null && newPassword.isNotEmpty) {
      await changePassword(userId, newPassword);
      _loadMainApp(userName, "Usuário comum");
    }
  }

  void _loadMainApp(String name, String role) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(name: name, role: role),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Stack(
        children: [
          Container(
            color: Colors.blue, // Defina a cor de fundo azul aqui
            height: double.infinity, // Garantir que ocupe toda a tela
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white.withOpacity(0.8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Senha'),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                      ),
                      const Text('Lembrar conta'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text('Entrar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
