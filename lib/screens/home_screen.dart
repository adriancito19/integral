import 'package:flutter/material.dart';
import '../models/video.dart';
import '../services/youtube_service.dart';
import '../widgets/video_card.dart';
import '../widgets/search_bar.dart';
import 'video_detail_screen.dart';  // Cambio aquí: importamos la nueva pantalla

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DigiSkills'),
        elevation: 0,
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
                                  builder: (context) => VideoDetailScreen(video: video),  // Cambio aquí
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