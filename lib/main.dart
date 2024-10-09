import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Carga',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => LoginScreen(),
        '/buonny': (ctx) => BuonnyScreen(),
        '/mensagens': (ctx) => MensagensScreen(),
        '/carga': (ctx) => CargaScreen(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Login' : 'Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!isLogin)
              TextField(
                decoration: InputDecoration(labelText: 'Nome'),
              ),
            TextField(
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            if (!isLogin)
              TextField(
                decoration: InputDecoration(labelText: 'Confirmar Senha'),
                obscureText: true,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/buonny');
              },
              child: Text(isLogin ? 'Entrar' : 'Cadastrar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(isLogin ? 'Criar conta' : 'Já possui conta? Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class BuonnyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta Buonny'),
      ),
      drawer: AppDrawer(), // Adiciona o Drawer (menu de navegação)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Motorista'),
            ),
            DropdownButtonFormField<String>(
              value: 'PERFIL ADEQUADO AO RISCO',
              items: [
                'PERFIL ADEQUADO AO RISCO',
                'PERFIL DIVERGENTE',
                'PERFIL COM INSUFICIENCIA DE DADOS',
                'EM PESQUISA',
                'CONSULTAR PROFISSIONAL',
                'EXPIRADO',
                'AGUARDANDO CADASTRO',
              ].map((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: InputDecoration(labelText: 'BUONNY'),
            ),
            DropdownButtonFormField<String>(
              value: 'SÓ CONSULTA',
              items: [
                'SÓ CONSULTA',
                'COBRAR INTEGRAL',
              ].map((String consulta) {
                return DropdownMenuItem<String>(
                  value: consulta,
                  child: Text(consulta),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: InputDecoration(labelText: 'Consulta Buonny'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Destino'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Enviar Consulta'),
            ),
          ],
        ),
      ),
    );
  }
}

class MensagensScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensagens Padrão'),
      ),
      drawer: AppDrawer(), // Adiciona o Drawer (menu de navegação)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Botão 1 - Documentação'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Botão 2 - Fotos das Notas'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Botão 3 - Canhotos Datados'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Botão 4 - Endereço de Envio'),
            ),
          ],
        ),
      ),
    );
  }
}

class CargaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações da Carga'),
      ),
      drawer: AppDrawer(), // Adiciona o Drawer (menu de navegação)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: 'TMRC',
              items: [
                'TMRC',
                'CCM',
              ].map((String cliente) {
                return DropdownMenuItem<String>(
                  value: cliente,
                  child: Text(cliente),
                );
              }).toList(),
              onChanged: (value) {},
              decoration: InputDecoration(labelText: 'Cliente'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Destino'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Carga'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Motorista'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Placa Cavalo'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Placa Carreta'),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'CPF',
                hintText: '000.000.000-00',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Telefone',
                hintText: '(00) 0 0000-0000',
              ),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Previsão de Chegada'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Enviar Informações'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Consulta Buonny'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/buonny');
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Mensagens Padrão'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/mensagens');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Informações de Carga'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/carga');
            },
          ),
        ],
      ),
    );
  }
}
