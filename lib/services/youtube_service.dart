import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_constants.dart';
import '../models/video.dart';

class YouTubeService {
  // Usar la clave API directamente desde ApiConstants
  final String apiKey = ApiConstants.youtubeApiKey;

  // Buscar videos por palabra clave
  Future<List<Video>> searchVideos(String query, {int maxResults = 10}) async {
    final url =
        Uri.parse('${ApiConstants.youtubeBaseUrl}${ApiConstants.searchEndpoint}'
            '?part=snippet'
            '&maxResults=$maxResults'
            '&q=$query'
            '&type=video'
            '&key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];

      return items.map((item) => Video.fromJson(item)).toList();
    } else {
      throw Exception('Error al buscar videos: ${response.statusCode}');
    }
  }

  // Obtener videos de cursos por categoría
  Future<List<Video>> getCourseVideos(
      {String category = 'programacion', int maxResults = 10}) async {
    // Mapa de categorías y sus términos de búsqueda
    final Map<String, String> categoryQueries = {
      'programacion': 'curso+programacion+completo+tutorial',
      'desarrolloweb': 'curso+desarrollo+web+html+css+javascript+completo',
      'emprendimiento': 'curso+emprendimiento+negocios+completo',
      'marketing': 'curso+marketing+digital+completo',
      'diseno': 'curso+diseno+grafico+ui+ux+completo'
    };

    // Obtener la query para la categoría o usar la predeterminada
final String? searchQuery = categoryQueries[category] ?? categoryQueries['programacion'];

    final url = Uri.parse(
        '${ApiConstants.youtubeBaseUrl}${ApiConstants.searchEndpoint}'
        '?part=snippet'
        '&maxResults=$maxResults'
        '&q=$searchQuery'
        '&type=video'
        '&videoDuration=long' // Esto filtra por videos largos (>20 minutos)
        '&order=relevance' // Cambiar a relevance para mejores resultados educativos
        '&relevanceLanguage=es'
        '&key=$apiKey');

    final response = await http.get(url);
// realizado por adrian gonzalez
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];

      return items.map((item) => Video.fromJson(item)).toList();
    } else {
      throw Exception(
          'Error al obtener videos de cursos: ${response.statusCode}');
    }
  }

// Mantén el método original getPopularVideos() o reemplázalo con este
  Future<List<Video>> getPopularVideos() async {
    // Reutiliza el método de cursos con la categoría predeterminada
    return getCourseVideos(category: 'programacion', maxResults: 10);
  }
}
