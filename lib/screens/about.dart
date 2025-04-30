import 'package:flutter/material.dart';
import 'home_screen.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.school,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'DigiSkills Academy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Flexible(
                    child: Text('Aprende sin límites',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        )),
                  ),
                ],
              ),
            ),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }),
            const Divider(),
            // const Padding(
            //   padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            //   child: Text(
            //     'CATEGORÍAS',
            //     style: TextStyle(
            //       fontSize: 12,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: const Icon(Icons.home),
            //   title: const Text('Inicio'),
            //   onTap: () {
            //     Navigator.pop(context); // Cierra el drawer

            //     // Navega a la pantalla de inicio
            //     Navigator.pushReplacementNamed(
            //         context, '/'); // Asumimos que '/' es la ruta de inicio

            //     // Alternativa si no usas rutas nombradas:
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => const HomeScreen()),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.language),
            //   title: const Text('Desarrollo Web'),
            //   onTap: () => const Placeholder(),
            // ),
            // ListTile(
            //   leading: const Icon(Icons.phone_android),
            //   title: const Text('Desarrollo Móvil'),
            //   onTap: () => const Placeholder(),
            // ),
            // ListTile(
            //   leading: const Icon(Icons.data_usage),
            //   title: const Text('Ciencia de Datos'),
            //   onTap: () => const Placeholder(),
            // ),
            // ListTile(
            //   leading: const Icon(Icons.design_services),
            //   title: const Text('Diseño UX/UI'),
            //   onTap: () => const Placeholder(),
            // ),
            // const Divider(),
            // ListTile(
            //   leading: const Icon(Icons.bookmark),
            //   title: const Text('Guardados'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     // Aquí implementarías la navegación a la pantalla de guardados
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Función en desarrollo')),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.history),
            //   title: const Text('Historial'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     // Aquí implementarías la navegación al historial
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Función en desarrollo')),
            //     );
            //   },
            // ),
            // const Divider(),
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text('Configuración'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     // Aquí implementarías la navegación a configuración
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Función en desarrollo')),
            //     );
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pop(context);
                // Aquí implementarías un diálogo de información
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('DigiSkills Academy'),
                    content: const Text(
                        'Una aplicación para acceder a cursos gratuitos de YouTube. '
                        'Desarrollada por Adrian Alberto González Familia.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Acerca de esta aplicación',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Esta aplicación está diseñada para proporcionar a los usuarios una experiencia intuitiva y fluida. '
              'Está construida con Flutter, un poderoso framework para crear aplicaciones multiplataforma.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Versión: 1.0.0',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
