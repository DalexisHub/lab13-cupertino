import 'package:flutter/cupertino.dart';

import 'ui_constants.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key, required this.correoUsuario});

  final String correoUsuario;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Perfil')),
      child: SafeArea(
        child: ListView(
          padding: pagePadding,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Icon(
                CupertinoIcons.person_crop_circle_fill,
                size: 110,
                color: CupertinoColors.activeBlue,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                correoUsuario,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 34),
            CupertinoListSection.insetGrouped(
              backgroundColor: CupertinoColors.white,
              margin: EdgeInsets.zero,
              children: [
                CupertinoListTile(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  leadingSize: listIconSize,
                  leadingToTitle: 18,
                  leading: const Icon(CupertinoIcons.mail, size: 34),
                  title: const Text(
                    'Correo electrónico',
                    style: TextStyle(fontSize: 21),
                  ),
                  subtitle: Text(
                    correoUsuario,
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
