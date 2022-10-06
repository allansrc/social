import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // AuthStore auth = Modular.get();
  late bool _visible;

  @override
  void initState() {
    super.initState();
    _visible = true;
    Future.delayed(const Duration(milliseconds: 800)).whenComplete(setVisible);
    Future.delayed(const Duration(seconds: 3)).whenComplete(activationCheck);
  }

  void activationCheck() async {
    Modular.to.pushReplacementNamed('/login/');
  }

  void setVisible() async {
    setState(() => _visible = false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(99, 96, 254, .0),
              Color.fromRGBO(99, 96, 254, .1),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: AnimatedOpacity(
          opacity: !_visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
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
      ),
    );
  }
}
