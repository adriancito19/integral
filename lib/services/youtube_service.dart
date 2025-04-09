import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_constants.dart';
import '../models/video.dart';

class YouTubeService {
  // Usar la clave API directamente desde ApiConstants
  final String apiKey = ApiConstants.youtubeApiKey;

  // Buscar videos por palabra clave
  Future<List<Video>> searchVideos(String query, {int maxResults = 10}) async {
    final url = Uri.parse(
      '${ApiConstants.youtubeBaseUrl}${ApiConstants.searchEndpoint}'
      '?part=snippet'
      '&maxResults=$maxResults'
      '&q=$query'
      '&type=video'
      '&key=$apiKey'
    );

    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];
      
      return items.map((item) => Video.fromJson(item)).toList();
    } else {
      throw Exception('Error al buscar videos: ${response.statusCode}');
    }
  }

  // Obtener videos populares sobre habilidades digitales y emprendimiento
  Future<List<Video>> getPopularVideos() async {
    // Búsqueda de videos sobre habilidades digitales y emprendimiento
    final url = Uri.parse(
      '${ApiConstants.youtubeBaseUrl}${ApiConstants.searchEndpoint}'
      '?part=snippet'
      '&maxResults=10'
      '&q=habilidades+digitales+emprendimiento+cursos'
      '&type=video'
      '&order=viewCount'
      '&relevanceLanguage=es'
      '&key=$apiKey'
    );

    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];
      
      return items.map((item) => Video.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener videos populares: ${response.statusCode}');
    }
  }
}