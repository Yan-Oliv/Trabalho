const String collectionUsers = 'users';
const String keyNome = 'nome';
const String keyEmail = 'email';
const String keyTelefone = 'telefone';
const String keyEmailVerified = 'emailVerified';

class AppConstants {
  static const Map<String, String> messagesBuonny = {
    "Desconto Buonny (1º Carregamento)":
        "Para primeiro carregamento com a empresa, é descontado o valor de R\$80,00 devido ao cadastro buonny pela empresa.",
    "Desconto Buonny (2º Carregamento (OK))":
        "Para os demais carregamentos, onde é realizado apenas a consulta buonny, é descontado o valor de R\$10,00.",
    "...": "Resumo por brevidade."
  };

  static const Map<String, String> messagesCarga = {
    "Notas Carregamento Platina":
        "Assim que você carregar me manda as fotos de todas as notas pegando somente a baixo do código de barras...",
    "Notas Carregamento CCM/TMRC":
        "Assim que carregar, me mande as fotos de todas notas de duas em duas mostrando somente abaixo do código de...",
  };

  static const Map<String, String> messagesEntrega = {
    "Canhotos Descarga":
        "AO FINALIZAR A DESCARGA, FAVOR ME ENVIAR AS FOTOS DOS CANHOTOS DATADOS, ASSINADOS E CARIMBADOS...",
    "Endereço Envio dos Canhotos":
        "Favor enviar os canhotos no endereço abaixo:\nRua Paulo Luiz Colgnese, 190\nPiracicaba - SP...",
  };
}
