class Carga {
  String tipoAlvo;
  String origem;
  String destino;
  String tipoVeiculo;
  String tipoProduto;
  String qtdPalete;
  String metragemCubica;
  String peso;
  String valor;
  String diaCarregamento;
  String diaDescarga;

  Carga({
    this.tipoAlvo = '',
    this.origem = '',
    this.destino = '',
    this.tipoVeiculo = '',
    this.tipoProduto = '',
    this.qtdPalete = '',
    this.metragemCubica = '',
    this.peso = '',
    this.valor = '',
    this.diaCarregamento = '',
    this.diaDescarga = '',
  });

  // Método para gerar mensagem a partir dos dados
  String gerarMensagem() {
    return 'Mensagem gerada com os dados do formulário:\n'
        'Tipo Alvo: $tipoAlvo\n'
        'Origem: $origem\n'
        'Destino: $destino\n'
        'Tipo de Veículo: $tipoVeiculo\n'
        'Tipo de Produto: $tipoProduto\n'
        'Peso: $peso\n'
        'Valor: $valor\n'
        'Dia Carregamento: $diaCarregamento\n'
        'Dia Descarga: $diaDescarga';
  }
}
