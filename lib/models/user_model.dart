class UserModel {
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final bool emailVerified;
  final bool isAdmin; // Campo para permissões de administrador

  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.emailVerified,
    this.isAdmin = false, // Define false por padrão
  });

  // Construtor para criar um objeto UserModel a partir de um mapa
  factory UserModel.fromMap(Map<String, dynamic> data, String documentId) {
    return UserModel(
      id: documentId,
      nome: data['nome'] ?? '',
      email: data['email'] ?? '',
      telefone: data['telefone'] ?? '',
      emailVerified: data['emailVerified'] ?? false,
      isAdmin: data['isAdmin'] ?? false, // Verifica se o campo existe
    );
  }

  // Converte o objeto UserModel para um mapa
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'emailVerified': emailVerified,
      'isAdmin': isAdmin, // Adiciona o campo isAdmin ao mapa
    };
  }

  // Exemplo de usuário padrão (atualmente logado)
  static UserModel currentUser = UserModel(
    id: '0',
    nome: 'Usuário Padrão',
    email: 'user@ciacat.com',
    telefone: '0000-0000',
    emailVerified: true,
    isAdmin: false, // Alterar para true para definir como administrador
  );
}
