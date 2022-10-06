import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: implements login
  final userController = TextEditingController();

  final passController = TextEditingController();

  late bool _isLoading;

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 166 * (MediaQuery.of(context).size.height / 800),
            margin: EdgeInsets.only(top: .35 * (MediaQuery.of(context).size.height / 800)),
            child: CircleAvatar(
              radius: 50,
              child: Image.asset(
                'assets/gb-logo.png',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: TextField(
            controller: userController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email, Usuário',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: TextField(
            obscureText: true,
            controller: passController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Senha',
            ),
          ),
        ),
        const SizedBox(height: 28),
        Container(
            height: 78,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = !_isLoading;
                });
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    _isLoading = !_isLoading;
                  });

                  Modular.to.pushReplacementNamed('/home/');
                });
              },
              child: !_isLoading
                  ? const Text('Entrar')
                  : const CircularProgressIndicator(
                      color: Colors.amber,
                    ),
            ))
      ],
    ));
  }
}
