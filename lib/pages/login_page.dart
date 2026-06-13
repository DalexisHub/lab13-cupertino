import 'package:flutter/cupertino.dart';

import 'menu_page.dart';
import 'ui_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _iniciarSesion() {
    final String correo = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (correo.isEmpty || password.isEmpty) {
      showCupertinoDialog<void>(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Datos incompletos'),
            content: const Text('Ingresa tu correo y contraseña.'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      CupertinoPageRoute<void>(
        builder: (context) => MenuPage(correoUsuario: correo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Login')),
      child: SafeArea(
        child: Padding(
          padding: pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'App Personas',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'Correo electrónico',
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Icon(CupertinoIcons.mail, size: 28),
                ),
                padding: fieldPadding,
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Contraseña',
                obscureText: true,
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Icon(CupertinoIcons.lock, size: 28),
                ),
                padding: fieldPadding,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  minimumSize: const Size(double.infinity, 58),
                  onPressed: _iniciarSesion,
                  child: const Text('Ingresar', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
