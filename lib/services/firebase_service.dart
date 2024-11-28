import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/buonny_model.dart'; // Ajuste para o local correto do arquivo

class FirebaseService {
  final CollectionReference consultasRef =
      FirebaseFirestore.instance.collection('consultas');

  // Adiciona nova consulta
  Future<void> addConsulta(Consulta consulta) async {
    await consultasRef.add(consulta.toMap());
  }

  // Atualiza consulta existente
  Future<void> updateConsulta(String id, Consulta consulta) async {
    await consultasRef.doc(id).update(consulta.toMap());
  }

  // Exclui consulta
  Future<void> deleteConsulta(String id) async {
    await consultasRef.doc(id).delete();
  }

  // Obtém todas as consultas
  Stream<List<Consulta>> getConsultas() {
    return consultasRef.snapshots().map((snapshot) => snapshot.docs
        .map((doc) =>
            Consulta.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList());
  }
}
