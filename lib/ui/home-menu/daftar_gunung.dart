import 'package:flutter/material.dart';
import 'package:hike_abis/providers/gunung_provider.dart';
import 'package:provider/provider.dart';

class DaftarGunungPage extends StatelessWidget {
  const DaftarGunungPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gunungProvider = Provider.of<GunungProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Daftar Gunung Pendakian',
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
        actions: [
          IconButton(
            icon:
                const Icon(Icons.filter_alt_rounded, color: Color(0xFF34373A)),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          endIndent: 135,
                          thickness: 3,
                          indent: 135,
                          color: Colors.black54,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Filter Lokasi",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            children: [
                              "Semua",
                              "Jawa Timur",
                              "Jawa Tengah",
                              "Nusa Tenggara Barat",
                              "Sumatra Barat",
                              "Papua",
                            ].map((lokasi) {
                              return ListTile(
                                title: Text(lokasi),
                                onTap: () {
                                  gunungProvider.setFilter(lokasi);
                                  Navigator.pop(context);
                                },
                                selected: gunungProvider.filterLokasi == lokasi,
                                selectedTileColor: Colors.grey[200],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: gunungProvider.gunungList.length,
              itemBuilder: (context, index) {
                final gunung = gunungProvider.gunungList[index];
                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: ListTile(
                    title: Text(gunung.nama,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Text(
                        "${gunung.lokasi} - ${gunung.ketinggian} mdpl",
                        style: const TextStyle(fontSize: 13)),
                    leading: const Icon(Icons.terrain, color: Colors.green),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
