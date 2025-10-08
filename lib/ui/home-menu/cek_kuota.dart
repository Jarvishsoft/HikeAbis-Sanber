import 'package:flutter/material.dart';
import 'package:hike_abis/providers/kuota_provider.dart';
import 'package:provider/provider.dart';

class CekKuotaPage extends StatelessWidget {
  const CekKuotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Kuota Pendakian',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: const Color(0xFFB7BAE4),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 16),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future:
            Provider.of<KuotaProvider>(context, listen: false).fetchKuotaData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2.5,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
          } else {
            return Consumer<KuotaProvider>(
              builder: (context, kuotaProvider, child) {
                final gunungKuotaList = kuotaProvider.gunungKuotaList;

                if (gunungKuotaList.isEmpty) {
                  return const Center(child: Text("Tidak ada data kuota."));
                }
                return ListView.builder(
                  itemCount: gunungKuotaList.length,
                  itemBuilder: (context, index) {
                    final gunung = gunungKuotaList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: ListTile(
                        title: Text(gunung.namaGunung,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        subtitle: Text(
                            "Kuota Tersedia : ${gunung.kuotaTersedia}/${gunung.kuotaTotal}",
                            style: const TextStyle(fontSize: 13)),
                        trailing: gunung.kuotaTersedia > 0
                            ? const Icon(Icons.check_circle,
                                color: Colors.green)
                            : const Icon(Icons.error, color: Colors.red),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
