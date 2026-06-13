import 'package:flutter/cupertino.dart';

import '../data/personas_data.dart';
import 'ui_constants.dart';

class ListadoPersonasPage extends StatelessWidget {
  const ListadoPersonasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Listado')),
      child: SafeArea(
        child: ListView(
          padding: pagePadding,
          children: [
            const Text(
              'Listado de personas',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 26),
            CupertinoListSection.insetGrouped(
              backgroundColor: CupertinoColors.white,
              margin: EdgeInsets.zero,
              children: personasRegistradas.map((persona) {
                return CupertinoListTile(
                  padding: listTilePadding,
                  leadingSize: listIconSize,
                  leadingToTitle: 18,
                  leading: const Icon(CupertinoIcons.person_circle, size: 34),
                  title: Text(
                    persona.nombre,
                    style: const TextStyle(fontSize: 21),
                  ),
                  subtitle: Text(
                    '${persona.correo} - ${persona.telefono}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: const CupertinoListTileChevron(),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
