import 'package:flutter/material.dart';
import 'package:hike_abis/models/gunung_model/gunung_model.dart';

class GunungProvider with ChangeNotifier {
  final List<Gunung> _gunungList = [
    Gunung(
        nama: "Gunung Rinjani",
        lokasi: "Nusa Tenggara Barat",
        ketinggian: 3726),
    Gunung(nama: "Gunung Merbabu", lokasi: "Jawa Tengah", ketinggian: 3142),
    Gunung(nama: "Gunung Bromo", lokasi: "Jawa Timur", ketinggian: 2329),
    Gunung(nama: "Gunung Semeru", lokasi: "Jawa Timur", ketinggian: 3676),
    Gunung(
        nama: "Gunung Merapi",
        lokasi: "Jawa Tengah & Yogyakarta",
        ketinggian: 2930),
    Gunung(
        nama: "Gunung Rinjani",
        lokasi: "Nusa Tenggara Barat",
        ketinggian: 3726),
    Gunung(nama: "Gunung Kerinci", lokasi: "Sumatra Barat", ketinggian: 3805),
    Gunung(nama: "Gunung Merbabu", lokasi: "Jawa Tengah", ketinggian: 3142),
    Gunung(nama: "Gunung Sindoro", lokasi: "Jawa Tengah", ketinggian: 3136),
    Gunung(nama: "Gunung Sumbing", lokasi: "Jawa Tengah", ketinggian: 3371),
    Gunung(
        nama: "Gunung Lawu",
        lokasi: "Jawa Tengah & Jawa Timur",
        ketinggian: 3265),
    Gunung(nama: "Gunung Agung", lokasi: "Bali", ketinggian: 3142),
    Gunung(nama: "Gunung Ijen", lokasi: "Jawa Timur", ketinggian: 2799),
    Gunung(
        nama: "Gunung Tambora",
        lokasi: "Nusa Tenggara Barat",
        ketinggian: 2850),
    Gunung(nama: "Gunung Krakatau", lokasi: "Selat Sunda", ketinggian: 813),
    Gunung(nama: "Gunung Arjuno", lokasi: "Jawa Timur", ketinggian: 3339),
    Gunung(nama: "Gunung Welirang", lokasi: "Jawa Timur", ketinggian: 3156),
    Gunung(nama: "Gunung Pangrango", lokasi: "Jawa Barat", ketinggian: 3019),
    Gunung(nama: "Gunung Gede", lokasi: "Jawa Barat", ketinggian: 2958),
    Gunung(nama: "Gunung Papandayan", lokasi: "Jawa Barat", ketinggian: 2665),
    Gunung(nama: "Gunung Salak", lokasi: "Jawa Barat", ketinggian: 2211),
    Gunung(nama: "Gunung Patuha", lokasi: "Jawa Barat", ketinggian: 2434),
    Gunung(nama: "Gunung Dempo", lokasi: "Sumatra Selatan", ketinggian: 3173),
    Gunung(
        nama: "Gunung Leuser",
        lokasi: "Aceh & Sumatra Utara",
        ketinggian: 3466),
    Gunung(
        nama: "Gunung Bukit Raya",
        lokasi: "Kalimantan Tengah",
        ketinggian: 2278),
    Gunung(
        nama: "Gunung Latimojong",
        lokasi: "Sulawesi Selatan",
        ketinggian: 3478),
    Gunung(nama: "Gunung Binaiya", lokasi: "Maluku", ketinggian: 3027),
    Gunung(nama: "Gunung Jayawijaya", lokasi: "Papua", ketinggian: 4884),
    Gunung(nama: "Gunung Carstensz Pyramid", lokasi: "Papua", ketinggian: 4884),
  ];

  // default filter = semua gunung
  String _filterLokasi = 'Semua';
  List<Gunung> get gunungList => _filterLokasi == 'Semua'
      ? _gunungList
      : _gunungList
          .where((gunung) => gunung.lokasi.contains(_filterLokasi))
          .toList();

  String get filterLokasi => _filterLokasi;

  void setFilter(String lokasi) {
    _filterLokasi = lokasi;
    notifyListeners();
  }
}
