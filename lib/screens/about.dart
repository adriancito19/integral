import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'home_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child:const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                    SizedBox(height: 10),
                    Text(
                    'Adrian González',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Flexible(
                    child: Text('Desarrollador de esta App',
                        style: TextStyle(
                          color: Colors.white70,
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Sobre el Desarrollador'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeIn(
                          duration: const Duration(milliseconds: 500),
                          child: const Text(
                            '¡Hola! Soy Adrián Alberto González Familia, el creador de esta aplicación.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SlideInRight(
                          duration: const Duration(milliseconds: 600),
                          child: const Text(
                            'Con 20 años, me apasiona el mundo del desarrollo de aplicaciones móviles y la creación de soluciones digitales innovadoras.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ZoomIn(
                          delay: const Duration(milliseconds: 700),
                          duration: const Duration(milliseconds: 400),
                          child: const Text(
                            'Esta app, DigiSkills Academy, es un proyecto personal con el objetivo de facilitar el acceso a la educación a través de los recursos gratuitos que ofrece YouTube.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 10),
                        BounceInUp(
                          delay: const Duration(milliseconds: 800),
                          duration: const Duration(milliseconds: 500),
                          child: const Text(
                            '¡Espero que la encuentres útil y disfrutes aprendiendo con ella!',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
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
      body: Stack(
        children: [
          // Fondo moderno con gradiente suave
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.shade50,
                  Colors.white,
                  Colors.blue.shade50,
                ],
              ),
            ),
          ),
          
          // Círculos decorativos
          Positioned(
            top: -50,
            right: -30,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.1),
              ),
            ),
          ),
          
          Positioned(
            bottom: -70,
            left: -40,
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.1),
              ),
            ),
          ),
          
          // Contenido principal
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    
                    // Sección de perfil
                    FadeInDown(
                      duration: const Duration(milliseconds: 600),
                      child: Card(
                        elevation: 4,
                        shadowColor: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.blue.shade600, Colors.blue.shade800],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            children: [
                              // Avatar con borde
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    size: 70,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              
                              // Nombre con efecto
                              FadeInUp(
                                duration: const Duration(milliseconds: 800),
                                child: const Text(
                                  'Adrián González',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              
                              // Subtítulo
                              const Text(
                                'Desarrollador & Fundador',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 24),
                              
                              // Botones de contacto
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildContactButton(
                                    icon: Icons.email_outlined,
                                    color: Colors.red.shade400,
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 16),
                                  _buildContactButton(
                                    icon: Icons.phone_outlined,
                                    color: Colors.green.shade400,
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 16),
                                  _buildContactButton(
                                    icon: Icons.public_outlined,
                                    color: Colors.purple.shade400,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Acerca de esta aplicación (del código original)
                    FadeInDown(
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        'Acerca de esta aplicación',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Información de la app (del código original)
                    SlideInLeft(
                      duration: const Duration(milliseconds: 600),
                      child: Card(
                        elevation: 2,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Esta aplicación está diseñada para proporcionar a los usuarios una experiencia intuitiva y fluida, permitiéndoles descubrir y acceder fácilmente a una amplia variedad de cursos gratuitos alojados en YouTube.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    SlideInRight(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 600),
                      child: Card(
                        elevation: 2,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Construida con Flutter, un framework moderno y potente, DigiSkills Academy busca ser una herramienta valiosa en tu camino de aprendizaje continuo.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Sección "Mi historia"
                    FadeInLeft(
                      delay: const Duration(milliseconds: 300),
                      duration: const Duration(milliseconds: 800),
                      child: _buildInfoSection(
                        title: 'Mi Historia',
                        icon: Icons.auto_stories_outlined,
                        color: Colors.indigo,
                        content: 'Con 20 años, mi curiosidad por la tecnología y la pasión por el aprendizaje me llevaron al fascinante mundo del desarrollo de aplicaciones móviles. Creo firmemente en el poder de la educación accesible para todos.',
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Sección "Mi visión"
                    FadeInRight(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 800),
                      child: _buildInfoSection(
                        title: 'Mi Visión para DigiSkills',
                        icon: Icons.lightbulb_outline,
                        color: Colors.amber.shade700,
                        content: 'DigiSkills Academy es mi proyecto para democratizar el acceso al conocimiento. Quiero que esta plataforma sea un punto de encuentro para aquellos que buscan aprender de manera gratuita y flexible.',
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Mis habilidades
                    FadeInUp(
                      delay: const Duration(milliseconds: 900),
                      duration: const Duration(milliseconds: 800),
                      child: Card(
                        elevation: 3,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.code,
                                    color: Colors.blue.shade700,
                                    size: 28,
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    'Mis Habilidades',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              _buildSkillBar(context, 'Flutter', 0.9, Colors.blue),
                              const SizedBox(height: 12),
                              _buildSkillBar(context, 'Dart', 0.85, Colors.teal),
                              const SizedBox(height: 12),
                              _buildSkillBar(context, 'UI/UX', 0.8, Colors.purple),
                              const SizedBox(height: 12),
                              _buildSkillBar(context, 'Firebase', 0.75, Colors.amber),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Versión de la app (del código original)
                    FadeInUp(
                      delay: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 500),
                      child: const Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.info_outline, color: Colors.blue),
                              SizedBox(width: 8),
                              Text(
                                'Versión: 1.0.0',
                                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Información de contacto
                    FadeInUp(
                      delay: const Duration(milliseconds: 1200),
                      duration: const Duration(milliseconds: 800),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              '¡Conéctate Conmigo!',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildContactInfo(
                              Icons.badge_outlined,
                              'Matrícula',
                              '20230608',
                            ),
                            const Divider(height: 24),
                            _buildContactInfo(
                              Icons.phone_outlined,
                              'Número',
                              '829-835-0335',
                            ),
                            const Divider(height: 24),
                            _buildContactInfo(
                              Icons.email_outlined,
                              'Correo',
                              'adrian.glez1904@gmail.com',
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Agradecimiento (del código original pero con el nuevo estilo)
                    Pulse(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(seconds: 2),
                      infinite: true,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue.shade400, Colors.blue.shade600],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          '¡Gracias por usar DigiSkills',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para crear las secciones de información
  Widget _buildInfoSection({
    required String title,
    required IconData icon,
    required Color color,
    required String content,
  }) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para crear los botones de contacto
  Widget _buildContactButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: color,
          size: 28,
        ),
      ),
    );
  }

  // Widget para mostrar la información de contacto
  Widget _buildContactInfo(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.blue.shade700,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget para mostrar las barras de habilidades
  Widget _buildSkillBar(BuildContext context, String skill, double level, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${(level * 100).toInt()}%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 10,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7 * level,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withOpacity(0.7), color],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}