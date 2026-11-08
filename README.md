# CIA-CAT — protótipo com Firebase

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white) ![Firebase](https://img.shields.io/badge/Firebase-DD2C00?style=flat-square&logo=firebase&logoColor=white) ![Protótipo](https://img.shields.io/badge/Protótipo-6b7280?style=flat-square)

Primeiro protótipo do *Cia Cat* em **Flutter + Firebase**, criado para tirar a operação logística das planilhas.

## Funcionalidades

- Login com **Firebase Authentication**
- Cadastro e acompanhamento de **cargas**
- Consulta **Buonny** (gerenciamento de risco)
- **Mensagens** internas
- Gestão de **usuários**
- Dados no **Cloud Firestore**

## Estrutura

```
lib/
  models/    carga, buonny, login, user
  screens/   login, home, cargas, buonny, mensagens, usuários
  services/  autenticação e Firebase
  widgets/   drawer e indicador de status
```

## Como executar

Configure um projeto Firebase (`flutterfire configure`) e rode:

```bash
flutter pub get
flutter run
```

---

<sub>Desenvolvido por <a href="https://github.com/Yan-Oliv">Yan Monteiro</a> · <a href="https://www.linkedin.com/in/yan-de-oliveira-gon%C3%A7alves-monteiro-a2886619a/">LinkedIn</a> · <a href="https://github.com/OmnyaTech">OmnyaTech</a></sub>
