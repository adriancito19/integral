import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/video.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoDetailScreen extends StatefulWidget {
  final Video video;

  const VideoDetailScreen({super.key, required this.video});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  double _progress = 0.0;
  bool _isWatching = false;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final progress = prefs.getDouble('video_progress_${widget.video.id}') ?? 0.0;
    setState(() {
      _progress = progress;
    });
  }

  Future<void> _saveProgress(double progress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('video_progress_${widget.video.id}', progress);
  }

Future<void> _openYouTubeVideo() async {
  final String videoId = widget.video.id;
  
  // URL para abrir directamente en la app de YouTube
  final Uri youtubeAppUri = Uri.parse('vnd.youtube:$videoId');
  
  // URL para abrir en el navegador si la app no está disponible
  final Uri youtubeWebUri = Uri.parse('https://www.youtube.com/watch?v=$videoId');
  
  try {
    // Primero intenta abrir la app
    if (await canLaunchUrl(youtubeAppUri)) {
      setState(() {
        _isWatching = true;
      });
      
      _simulateProgress();
      await launchUrl(youtubeAppUri);
    } 
    // Si no puede abrir la app, intenta con el navegador
    else if (await canLaunchUrl(youtubeWebUri)) {
      setState(() {
        _isWatching = true;
      });
      
      _simulateProgress();
      await launchUrl(youtubeWebUri);
    } 
    else {
      throw 'No se pudo abrir el video';
    }
  } catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: No se pudo abrir YouTube. $e')),
      );
    }
  }
}

  void _simulateProgress() {
    // Esta es una simulación simple. En una aplicación real,
    // deberías implementar una forma de rastrear el progreso real del video.
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && _isWatching) {
        setState(() {
          _progress += 0.1;
          if (_progress > 1.0) _progress = 1.0;
        });
        _saveProgress(_progress);
        
        if (_progress < 1.0) {
          _simulateProgress();
        } else {
          _isWatching = false;
        }
      }
    });
  }

  void _resetProgress() {
    setState(() {
      _progress = 0.0;
    });
    _saveProgress(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.video.title,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetProgress,
            tooltip: 'Reiniciar progreso',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del video con botón de reproducción
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  widget.video.thumbnailUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Indicador de progreso sobre la imagen
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.white.withOpacity(0.5),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                    minHeight: 8,
                  ),
                ),
                // Botón de reproducción
                IconButton(
                  icon: const Icon(
                    Icons.play_circle_fill,
                    size: 64,
                    color: Colors.white,
                  ),
                  onPressed: _openYouTubeVideo,
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Información del progreso
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progreso: ${(_progress * 100).toInt()}%',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Ver en YouTube'),
                        onPressed: _openYouTubeVideo,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Título y detalles del video
                  Text(
                    widget.video.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.video.channelTitle,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.video.description,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}