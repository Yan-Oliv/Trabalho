import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart'; // Mantido, pois está sendo usado
import 'widgets/custom_drawer.dart'; // Mantido, pois está sendo usado

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CiacatApp());
}

class CiacatApp extends StatelessWidget {
  const CiacatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ciacat System',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ciacat Home'),
      ),
      drawer:
          const CustomDrawer(), // Adicionei const aqui para melhorar o desempenho
      body: const Center(
        child: Text('Bem-vindo ao Ciacat!'),
      ),
    );
  }
}
