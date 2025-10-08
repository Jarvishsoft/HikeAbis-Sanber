import 'package:flutter/material.dart';

import '../../models/berita_model/berita_model.dart';

class DetailBeritaPage extends StatelessWidget {
  final BeritaModel berita;

  const DetailBeritaPage({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(berita.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (berita.urlToImage.isNotEmpty)
              Image.network(berita.urlToImage, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              berita.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Penulis: ${berita.author}"),
            const SizedBox(height: 8),
            Text("Tanggal: ${berita.publishedAt}"),
            const SizedBox(height: 16),
            Text(berita.content),
          ],
        ),
      ),
    );
  }
}
