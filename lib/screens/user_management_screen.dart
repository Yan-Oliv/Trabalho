import 'package:flutter/material.dart';

class UserManagementScreen extends StatelessWidget {
  final bool isAdmin;

  const UserManagementScreen({Key? key, required this.isAdmin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isAdmin) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Acesso Negado"),
        ),
        body: const Center(
          child: Text(
            "Você não tem permissão para acessar esta tela.",
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciamento de Usuários"),
      ),
      body: const UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    // Simula a consulta ao banco de dados ou API
    await Future.delayed(const Duration(seconds: 1)); // Simulação de atraso

    setState(() {
      users = [
        {
          "id": 1,
          "name": "Admin",
          "email": "admin@example.com",
          "role": "Administrador",
          "branch": "Catalão"
        },
        {
          "id": 2,
          "name": "Usuário Comum",
          "email": "user@example.com",
          "role": "Usuário comum",
          "branch": "Piracicaba"
        },
      ];
    });
  }

  void editUser(Map<String, dynamic> user) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => UserFormScreen(user: user),
    ));
  }

  void deleteUser(int userId) {
    setState(() {
      users.removeWhere((user) => user['id'] == userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user['name']),
                subtitle: Text(user['email']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => editUser(user),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => deleteUser(user['id']),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const UserFormScreen(),
            ));
          },
          child: const Text("Adicionar Usuário"),
        ),
      ],
    );
  }
}

class UserFormScreen extends StatelessWidget {
  final Map<String, dynamic>? user;

  const UserFormScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: user?['name'] ?? '');
    final emailController = TextEditingController(text: user?['email'] ?? '');
    final branchController = TextEditingController(text: user?['branch'] ?? '');
    String role = user?['role'] ?? 'Usuário comum';

    void saveUser() {
      // Simula salvar no banco
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(user == null ? "Adicionar Usuário" : "Editar Usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "E-mail"),
            ),
            TextField(
              controller: branchController,
              decoration: const InputDecoration(labelText: "Filial"),
            ),
            DropdownButton<String>(
              value: role,
              items: ["Administrador", "Usuário comum", "Teste"].map((role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (newValue) {
                role = newValue!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveUser,
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
