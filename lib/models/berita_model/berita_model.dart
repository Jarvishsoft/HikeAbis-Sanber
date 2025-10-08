class BeritaModel {
  final String title;
  final String author;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;

  BeritaModel({
    required this.title,
    required this.author,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.publishedAt,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      title: json['title'] ?? 'Judul Tidak Tersedia',
      author: json['author'] ?? 'Penulis Tidak Diketahui',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      content: json['content'] ?? 'Konten Tidak Tersedia',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}
