import 'package:flutter/material.dart';
import '../models/buonny_model.dart'; // Ajuste para o local correto do arquivo
import '../services/firebase_service.dart'; // Ajuste para o local correto do arquivo

class BuonnyScreen extends StatefulWidget {
  const BuonnyScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuonnyScreenState createState() => _BuonnyScreenState();
}

class _BuonnyScreenState extends State<BuonnyScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  late Stream<List<Consulta>> _consultaStream;

  @override
  void initState() {
    super.initState();
    _consultaStream = _firebaseService.getConsultas();
  }

  // Função para exibir o formulário
  void _showForm({Consulta? consulta}) {
    final motoristaController =
        TextEditingController(text: consulta?.motorista ?? '');
    final buonyController = TextEditingController(text: consulta?.buony ?? '');
    final consultaController =
        TextEditingController(text: consulta?.consulta ?? '');
    final destinoController =
        TextEditingController(text: consulta?.destino ?? '');
    final tipoController = TextEditingController(text: consulta?.tipo ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text(consulta == null ? 'Adicionar Consulta' : 'Editar Consulta'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: motoristaController,
                decoration: const InputDecoration(labelText: 'Motorista')),
            TextField(
                controller: buonyController,
                decoration: const InputDecoration(labelText: 'Buony')),
            TextField(
                controller: consultaController,
                decoration: const InputDecoration(labelText: 'Consulta')),
            TextField(
                controller: destinoController,
                decoration: const InputDecoration(labelText: 'Destino')),
            TextField(
                controller: tipoController,
                decoration: const InputDecoration(labelText: 'Tipo')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              final newConsulta = Consulta(
                id: consulta?.id ?? '',
                motorista: motoristaController.text,
                buony: buonyController.text,
                consulta: consultaController.text,
                destino: destinoController.text,
                tipo: tipoController.text,
                lastUpdate: DateTime.now(),
              );

              if (consulta == null) {
                await _firebaseService.addConsulta(newConsulta);
              } else {
                await _firebaseService.updateConsulta(consulta.id, newConsulta);
              }

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  // Função para excluir consulta
  void _deleteConsulta(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir Consulta'),
        content: const Text('Tem certeza de que deseja excluir esta consulta?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              await _firebaseService.deleteConsulta(id);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas Buonny'),
      ),
      body: StreamBuilder<List<Consulta>>(
        stream: _consultaStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final consultas = snapshot.data ?? [];
          return ListView.builder(
            itemCount: consultas.length,
            itemBuilder: (context, index) {
              final consulta = consultas[index];
              return ListTile(
                title: Text(consulta.motorista),
                subtitle: Text('Destino: ${consulta.destino}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showForm(consulta: consulta),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteConsulta(consulta.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
