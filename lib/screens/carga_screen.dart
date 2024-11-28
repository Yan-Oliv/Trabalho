import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CargasApp extends StatefulWidget {
  const CargasApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CargasAppState createState() => _CargasAppState();
}

class _CargasAppState extends State<CargasApp> {
  // Variáveis de controle para o formulário
  final TextEditingController origemController = TextEditingController();
  final TextEditingController destinoController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  final TextEditingController diaCarregamentoController =
      TextEditingController();
  final TextEditingController diaDescargaController = TextEditingController();

  String tipoAlvo = '';
  String tipoVeiculo = '';
  String tipoProduto = '';
  String qtdPalete = '';
  String metragemCubica = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cargas")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Labels e Inputs
            buildLabel('Tipo Alvo:'),
            buildCheckBoxRow('MOTORISTA', 'GRUPO', tipoAlvo, (value) {
              setState(() {
                tipoAlvo = value;
              });
            }),
            buildInputField('Origem:', origemController),
            buildInputField('Destino:', destinoController),
            buildCheckBoxRow('CARRETA', 'TRUCK', tipoVeiculo, (value) {
              setState(() {
                tipoVeiculo = value;
              });
            }),
            buildCheckBoxRow('FARDO', 'PALETE', tipoProduto, (value) {
              setState(() {
                tipoProduto = value;
              });
            }),
            buildInputField('Peso:', pesoController),
            buildInputField('Valor:', valorController),
            buildInputField('Dia Carregamento:', diaCarregamentoController),
            buildInputField('Dia Descarga:', diaDescargaController),
            buildActionButtons()
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget buildCheckBoxRow(
      String label1, String label2, String value, Function(String) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: value == label1,
          onChanged: (bool? selected) {
            onChanged(selected! ? label1 : '');
          },
        ),
        Text(label1),
        Checkbox(
          value: value == label2,
          onChanged: (bool? selected) {
            onChanged(selected! ? label2 : '');
          },
        ),
        Text(label2),
      ],
    );
  }

  Widget buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            limparFormulario();
          },
          child: const Text("Limpar"),
        ),
        ElevatedButton(
          onPressed: () {
            copiarDados();
          },
          child: const Text("Copiar"),
        ),
      ],
    );
  }

  void limparFormulario() {
    setState(() {
      tipoAlvo = '';
      tipoVeiculo = '';
      tipoProduto = '';
      origemController.clear();
      destinoController.clear();
      pesoController.clear();
      valorController.clear();
      diaCarregamentoController.clear();
      diaDescargaController.clear();
    });
  }

  void copiarDados() {
    String mensagem = gerarMensagem();
    Clipboard.setData(ClipboardData(text: mensagem));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text("Dados copiados para a área de transferência!")),
    );
  }

  String gerarMensagem() {
    return 'Mensagem gerada com os dados do formulário:\n'
        'Tipo Alvo: $tipoAlvo\n'
        'Origem: ${origemController.text}\n'
        'Destino: ${destinoController.text}\n'
        'Tipo de Veículo: $tipoVeiculo\n'
        'Tipo de Produto: $tipoProduto\n'
        'Peso: ${pesoController.text}\n'
        'Valor: ${valorController.text}\n'
        'Dia Carregamento: ${diaCarregamentoController.text}\n'
        'Dia Descarga: ${diaDescargaController.text}';
  }
}
