import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/berita_model/berita_model.dart';

class BeritaProvider with ChangeNotifier {
  List<BeritaModel> _beritaList = [];
  bool _isLoading = false;

  List<BeritaModel> get beritaList => _beritaList;
  bool get isLoading => _isLoading;

  Future<void> fetchBerita() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2024-12-17&sortBy=publishedAt&apiKey=9af95c94e9da4c3db3f0aae245c1911e',
      ));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List articles = data['articles'] ?? [];
        _beritaList = articles.map((e) => BeritaModel.fromJson(e)).toList();
      } else {
        throw Exception("Gagal mengambil data");
      }
    } catch (e) {
      debugPrint("Error fetchBerita: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
