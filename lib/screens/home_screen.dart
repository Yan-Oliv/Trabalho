import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String role;

  const HomeScreen({Key? key, required this.name, required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Text('Welcome, $name ($role)'),
      ),
    );
  }
}
