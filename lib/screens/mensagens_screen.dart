import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: use_key_in_widget_constructors
class MensagensScreen extends StatelessWidget {
  final Map<String, String> messagesDocuments = {
    "Documentos Cadastro":
        "*FAVOR MANDAR A SEGUINTE DOCUMENTAÇÃO EM FOTO ABERTA OU PDF:*\n"
            "* CAVALO\n"
            "* CARRETA\n"
            "* ANTT\n"
            "* CNH DO MOTORISTA\n"
            "...", // Resumo por brevidade
    "Dados Bancários":
        "Assim que possível, me encaminhe seus dados bancários por favor:\n"
            "* Banco\n"
            "* Agência\n"
            "* Conta\n"
            "* Chave Pix\n"
            "* Nome do beneficiário",
  };

  void copyToClipboard(BuildContext context, String message) {
    Clipboard.setData(ClipboardData(text: message));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Mensagem copiada para a área de transferência!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Mensagens'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: messagesDocuments.entries.map((entry) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(entry.key),
              subtitle: Text(
                entry.value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () => copyToClipboard(context, entry.value),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
