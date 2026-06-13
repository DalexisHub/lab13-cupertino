import 'package:flutter/cupertino.dart';

import 'login_page.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  void _cerrarSesion(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute<void>(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Logout')),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.square_arrow_right,
                size: 90,
                color: CupertinoColors.systemRed,
              ),
              const SizedBox(height: 25),
              const Text(
                '¿Deseas cerrar sesión?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Text(
                'Al cerrar sesión volverás a la pantalla de login.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  onPressed: () => _cerrarSesion(context),
                  child: const Text('Cerrar sesión'),
                ),
              ),
              const SizedBox(height: 15),
              CupertinoButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
