import 'package:flutter/material.dart';
import '../models/video.dart';
import '../services/youtube_service.dart';
import '../widgets/video_card.dart';
import '../widgets/search_bar.dart';
import 'video_detail_screen.dart';  
import 'about.dart'; // Importa la pantalla de "Acerca de"

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final YouTubeService _youtubeService = YouTubeService();
  List<Video> _videos = [];
  bool _isLoading = true;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _loadInitialVideos();
  }

  Future<void> _loadInitialVideos() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final videos = await _youtubeService.getPopularVideos();
      setState(() {
        _videos = videos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog('Error al cargar videos: $e');
    }
  }

  Future<void> _searchVideos(String query) async {
    if (query.trim().isEmpty) {
      return _loadInitialVideos();
    }

    setState(() {
      _isLoading = true;
      _searchQuery = query;
    });

    try {
      final videos = await _youtubeService.searchVideos(query);
      setState(() {
        _videos = videos;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog('Error al buscar videos: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Método para filtrar por categoría
  void _filterByCategory(String category) {
    // Cerrar el drawer
    Navigator.pop(context);
    
    // Actualizar la interfaz
    setState(() {
      _searchQuery = category;
      _searchController.text = category;
    });
    
    // Realizar la búsqueda
    _searchVideos(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DigiSkills'),
        elevation: 0,
      ),
      
      // Aquí se implementa el drawer (menú lateral)
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
                  child: Text(
                    'Aprende sin límites',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                _loadInitialVideos();
                setState(() {
                  _searchQuery = '';
                  _searchController.clear();
                });
              },
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: Text(
                'CATEGORÍAS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Desarrollo Web'),
              onTap: () => _filterByCategory('curso desarrollo web'),
            ),
            ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text('Desarrollo Móvil'),
              onTap: () => _filterByCategory('curso desarrollo móvil flutter'),
            ),
            ListTile(
              leading: const Icon(Icons.data_usage),
              title: const Text('Ciencia de Datos'),
              onTap: () => _filterByCategory('curso data science'),
            ),
            ListTile(
              leading: const Icon(Icons.design_services),
              title: const Text('Diseño UX/UI'),
              onTap: () => _filterByCategory('curso diseño ux ui'),
            ),
            const Divider(),
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
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                
                // Navega a la pantalla de inicio
                Navigator.pushReplacementNamed(context, '/'); // Asumimos que '/' es la ruta de inicio
                // Alternativa si no usas rutas nombradas:
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
      
      body: Column(
        children: [
          // Barra de búsqueda personalizada
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              controller: _searchController,
              onSearch: _searchVideos,
              hintText: 'Buscar cursos y tutoriales...',
            ),
          ),
          
          // Título de sección
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  _searchQuery.isNotEmpty
                      ? 'Resultados para "$_searchQuery"'
                      : 'Cursos recomendados',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (_searchQuery.isNotEmpty)
                  TextButton(
                    onPressed: () {
                      _searchController.clear();
                      _searchQuery = '';
                      _loadInitialVideos();
                    },
                    child: const Text('Limpiar'),
                  ),
              ],
            ),
          ),
          
          // Lista de videos
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _videos.isEmpty
                    ? const Center(child: Text('No se encontraron videos'))
                    : ListView.builder(
                        itemCount: _videos.length,
                        padding: const EdgeInsets.all(8.0),
                        itemBuilder: (context, index) {
                          final video = _videos[index];
                          return VideoCard(
                            video: video,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoDetailScreen(video: video),
                                ),
                              );
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}