import 'package:flutter/cupertino.dart';

import '../data/personas_data.dart';
import '../models/persona.dart';
import 'ui_constants.dart';

class RegistroPersonaPage extends StatefulWidget {
  const RegistroPersonaPage({super.key});

  @override
  State<RegistroPersonaPage> createState() => _RegistroPersonaPageState();
}

class _RegistroPersonaPageState extends State<RegistroPersonaPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }

  void _guardarPersona() {
    final String nombre = _nombreController.text.trim();
    final String correo = _correoController.text.trim();
    final String telefono = _telefonoController.text.trim();

    if (nombre.isEmpty || correo.isEmpty || telefono.isEmpty) {
      _mostrarMensaje(
        titulo: 'Datos incompletos',
        mensaje: 'Completa nombre, correo y teléfono para registrar.',
      );
      return;
    }

    personasRegistradas.add(
      Persona(nombre: nombre, correo: correo, telefono: telefono),
    );

    _mostrarMensaje(
      titulo: 'Registro exitoso',
      mensaje: 'La persona fue registrada correctamente.',
      onAceptar: () {
        _nombreController.clear();
        _correoController.clear();
        _telefonoController.clear();
      },
    );
  }

  void _mostrarMensaje({
    required String titulo,
    required String mensaje,
    VoidCallback? onAceptar,
  }) {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(titulo),
          content: Text(mensaje),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
                onAceptar?.call();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Registro')),
      child: SafeArea(
        child: ListView(
          padding: pagePadding,
          children: [
            const Text(
              'Registro de personas',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 34),
            CupertinoTextField(
              controller: _nombreController,
              placeholder: 'Nombre completo',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 14),
                child: Icon(CupertinoIcons.person, size: 28),
              ),
              padding: fieldPadding,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            CupertinoTextField(
              controller: _correoController,
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
              controller: _telefonoController,
              placeholder: 'Teléfono',
              prefix: const Padding(
                padding: EdgeInsets.only(left: 14),
                child: Icon(CupertinoIcons.phone, size: 28),
              ),
              padding: fieldPadding,
              style: const TextStyle(fontSize: 20),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 34),
            CupertinoButton.filled(
              minimumSize: const Size(double.infinity, 58),
              onPressed: _guardarPersona,
              child: const Text('Guardar', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
