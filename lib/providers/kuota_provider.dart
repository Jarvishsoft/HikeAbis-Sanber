import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hike_abis/models/kuota_model/kuota_model.dart';

class KuotaProvider with ChangeNotifier {
  List<GunungKuota> _gunungKuotaList = [];

  List<GunungKuota> get gunungKuotaList => _gunungKuotaList;

  Future<void> fetchKuotaData() async {
    // simulasi pengambilan data
    await Future.delayed(const Duration(seconds: 2));
    _gunungKuotaList = [
      GunungKuota(
          namaGunung: "Gunung Bromo", kuotaTotal: 500, kuotaTersedia: 85),
      GunungKuota(
          namaGunung: "Gunung Semeru", kuotaTotal: 200, kuotaTersedia: 0),
      GunungKuota(
          namaGunung: "Gunung Rinjani", kuotaTotal: 400, kuotaTersedia: 120),
      GunungKuota(
          namaGunung: "Gunung Merbabu", kuotaTotal: 300, kuotaTersedia: 70),
    ];
    notifyListeners();
  }
}
