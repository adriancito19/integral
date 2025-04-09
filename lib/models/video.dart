class Video {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String channelTitle;
  final String publishedAt;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.channelTitle,
    required this.publishedAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];
    final thumbnails = snippet['thumbnails'];
    final videoId = json['id']['videoId'] ?? json['id'];
    
    return Video(
      id: videoId,
      title: snippet['title'],
      description: snippet['description'],
      thumbnailUrl: thumbnails['high']['url'],
      channelTitle: snippet['channelTitle'],
      publishedAt: snippet['publishedAt'],
    );
  }
}