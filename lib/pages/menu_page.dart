import 'package:flutter/cupertino.dart';

import 'listado_personas_page.dart';
import 'logout_page.dart';
import 'perfil_page.dart';
import 'registro_persona_page.dart';
import 'ui_constants.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key, required this.correoUsuario});

  final String correoUsuario;

  void _abrirPagina(BuildContext context, Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute<void>(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Menú')),
      child: SafeArea(
        child: ListView(
          padding: pagePadding,
          children: [
            const Text(
              'Menú principal',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 28),
            CupertinoListSection.insetGrouped(
              backgroundColor: CupertinoColors.white,
              margin: EdgeInsets.zero,
              children: [
                CupertinoListTile(
                  padding: listTilePadding,
                  leadingSize: listIconSize,
                  leadingToTitle: 18,
                  leading: const Icon(CupertinoIcons.person_add, size: 32),
                  title: const Text(
                    'Registro de personas',
                    style: TextStyle(fontSize: 21),
                  ),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () =>
                      _abrirPagina(context, const RegistroPersonaPage()),
                ),
                CupertinoListTile(
                  padding: listTilePadding,
                  leadingSize: listIconSize,
                  leadingToTitle: 18,
                  leading: const Icon(CupertinoIcons.list_bullet, size: 32),
                  title: const Text(
                    'Listado de personas',
                    style: TextStyle(fontSize: 21),
                  ),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () =>
                      _abrirPagina(context, const ListadoPersonasPage()),
                ),
                CupertinoListTile(
                  padding: listTilePadding,
                  leadingSize: listIconSize,
                  leadingToTitle: 18,
                  leading: const Icon(CupertinoIcons.person_circle, size: 32),
                  title: const Text('Perfil', style: TextStyle(fontSize: 21)),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _abrirPagina(
                    context,
                    PerfilPage(correoUsuario: correoUsuario),
                  ),
                ),
                CupertinoListTile(
                  padding: listTilePadding,
                  leadingSize: listIconSize,
                  leadingToTitle: 18,
                  leading: const Icon(
                    CupertinoIcons.square_arrow_right,
                    size: 32,
                  ),
                  title: const Text('Logout', style: TextStyle(fontSize: 21)),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _abrirPagina(context, const LogoutPage()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
