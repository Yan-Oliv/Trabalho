import 'package:cloud_firestore/cloud_firestore.dart';

class Consulta {
  String id;
  String motorista;
  String buony;
  String consulta;
  String destino;
  String tipo;
  DateTime lastUpdate;

  Consulta({
    required this.id,
    required this.motorista,
    required this.buony,
    required this.consulta,
    required this.destino,
    required this.tipo,
    required this.lastUpdate,
  });

  // Converte os dados de Firebase para objeto Consulta
  factory Consulta.fromMap(Map<String, dynamic> data, String documentId) {
    return Consulta(
      id: documentId,
      motorista: data['motorista'] ?? '',
      buony: data['buony'] ?? '',
      consulta: data['consulta'] ?? '',
      destino: data['destino'] ?? '',
      tipo: data['tipo'] ?? '',
      lastUpdate: (data['lastUpdate'] as Timestamp).toDate(),
    );
  }

  // Converte o objeto Consulta para Map para o Firebase
  Map<String, dynamic> toMap() {
    return {
      'motorista': motorista,
      'buony': buony,
      'consulta': consulta,
      'destino': destino,
      'tipo': tipo,
      'lastUpdate': lastUpdate,
    };
  }
}
