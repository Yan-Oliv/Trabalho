import 'package:flutter/material.dart';
import '../screens/buonny_screen.dart';
import '../screens/carga_screen.dart';
import '../screens/mensagens_screen.dart';
import '../screens/user_management_screen.dart';
import '../models/user_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel.currentUser; // Usuário logado

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu de Navegação',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Consulta Buonny'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BuonnyScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_shipping),
            title: const Text('Informações de Carga'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CargasApp()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Mensagens Padrão'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MensagensScreen()),
              );
            },
          ),
          if (user.isAdmin) // Apenas administradores
            ListTile(
              leading: const Icon(Icons.admin_panel_settings),
              title: const Text('Gerenciamento de Usuários'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserManagementScreen(
                      isAdmin: true, // Passa o valor diretamente
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
