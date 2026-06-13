import 'package:flutter/cupertino.dart';

void main() {
  runApp(const PersonasApp());
}

class PersonasApp extends StatelessWidget {
  const PersonasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'App Personas',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        brightness: Brightness.light,
      ),
      home: LoginPage(),
    );
  }
}

class Persona {
  const Persona({
    required this.nombre,
    required this.correo,
    required this.telefono,
  });

  final String nombre;
  final String correo;
  final String telefono;
}

final List<Persona> personasRegistradas = [
  const Persona(
    nombre: 'Diego Ccaihuari',
    correo: 'diego@email.com',
    telefono: '987654321',
  ),
  const Persona(
    nombre: 'Ana Torres',
    correo: 'ana@email.com',
    telefono: '912345678',
  ),
  const Persona(
    nombre: 'Carlos Ramos',
    correo: 'carlos@email.com',
    telefono: '956789123',
  ),
  const Persona(
    nombre: 'Lucía Mendoza',
    correo: 'lucia@email.com',
    telefono: '934567890',
  ),
];

const EdgeInsets _pagePadding = EdgeInsets.symmetric(
  horizontal: 24,
  vertical: 28,
);
const EdgeInsets _fieldPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 18,
);
const EdgeInsets _listTilePadding = EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 15,
);
const double _listIconSize = 34;

// 1. Login
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
          padding: _pagePadding,
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
                padding: _fieldPadding,
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
                padding: _fieldPadding,
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

// 2. Menú
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
          padding: _pagePadding,
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
                  padding: _listTilePadding,
                  leadingSize: _listIconSize,
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
                  padding: _listTilePadding,
                  leadingSize: _listIconSize,
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
                  padding: _listTilePadding,
                  leadingSize: _listIconSize,
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
                  padding: _listTilePadding,
                  leadingSize: _listIconSize,
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

// 3. Registro de personas
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
          padding: _pagePadding,
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
              padding: _fieldPadding,
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
              padding: _fieldPadding,
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
              padding: _fieldPadding,
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

// 4. Listado de personas
class ListadoPersonasPage extends StatelessWidget {
  const ListadoPersonasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Listado')),
      child: SafeArea(
        child: ListView(
          padding: _pagePadding,
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
                  padding: _listTilePadding,
                  leadingSize: _listIconSize,
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

// 5. Perfil
class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key, required this.correoUsuario});

  final String correoUsuario;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Perfil')),
      child: SafeArea(
        child: ListView(
          padding: _pagePadding,
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  leadingSize: _listIconSize,
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

// 6. Logout
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
