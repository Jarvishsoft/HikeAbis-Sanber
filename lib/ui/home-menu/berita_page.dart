import 'package:flutter/material.dart';
import 'package:hike_abis/ui/home-menu/detail_berita.dart';
import 'package:provider/provider.dart';
import '../../models/berita_model/berita_model.dart';
import '../../providers/berita_provider.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({super.key});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<BeritaProvider>(context, listen: false).fetchBerita();
  }

  @override
  Widget build(BuildContext context) {
    final beritaProvider = Provider.of<BeritaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Warta Gunung"),
        backgroundColor: const Color(0xFFB7BAE4),
      ),
      body: beritaProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: beritaProvider.beritaList.length,
              itemBuilder: (context, index) {
                final BeritaModel berita = beritaProvider.beritaList[index];
                return ListTile(
                  leading: berita.urlToImage.isNotEmpty
                      ? Image.network(berita.urlToImage,
                          width: 100, fit: BoxFit.cover)
                      : const Icon(Icons.image_not_supported, size: 40),
                  title: Text(
                    berita.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    berita.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailBeritaPage(berita: berita),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
