import 'package:flutter/material.dart';
import 'package:hike_abis/providers/auth_provider.dart';
import 'package:hike_abis/ui/home-menu/berita_page.dart';
import 'package:hike_abis/ui/home-menu/book_page.dart';
import 'package:hike_abis/ui/home-menu/cek_kuota.dart';
import 'package:hike_abis/ui/home-menu/daftar_gunung.dart';
import 'package:hike_abis/ui/home-menu/panduan_page.dart';
import 'package:hike_abis/ui/home-menu/sop.dart';
import 'package:hike_abis/ui/home-menu/syarat_booking.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> menuItem = [
    {'title': 'Booking\nOnline', 'icon': 'assets/tiket.png'},
    {'title': 'Daftar\nGunung', 'icon': 'assets/gunung.png'},
    {'title': 'Panduan\nBooking', 'icon': 'assets/panduan.png'},
    {'title': 'Cek\nKuota', 'icon': 'assets/cek_kuota.png'},
    {'title': 'Warta\nGunung', 'icon': 'assets/berita.png'},
    {'title': 'SOP', 'icon': 'assets/sop.png'},
    {'title': 'Syarat\nBooking', 'icon': 'assets/persyaratan.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, resultState, _) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const Image(
                  image: AssetImage('assets/hikeabis_logo.png'),
                  fit: BoxFit.contain,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),
                const Text(
                  '"Your best partner for mountain hiking!"',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                const Text(
                  // 'Hi ${user!.name},',
                  'Hi, User',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Welcome to Hike Abis!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 12),
                // const Divider(color: Colors.black54),
                const SizedBox(height: 40),
                // ------- Menu Aplikasi -------
                // set flexible or expanded agar gak overflow
                Flexible(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      // mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: menuItem.length,
                    itemBuilder: (context, index) {
                      final item = menuItem[index];
                      return GestureDetector(
                        onTap: () {
                          switch (menuItem[index]['title']) {
                            case 'Booking\nOnline':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const BookingPage()));
                              break;
                            case 'Daftar\nGunung':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const DaftarGunungPage()));
                              break;
                            case 'Panduan\nBooking':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const PanduanBooking()));
                              break;
                            case 'Cek\nKuota':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const CekKuotaPage()));
                              break;
                            case 'Warta\nGunung':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const BeritaPage()));
                              break;
                            case 'SOP':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SOP()));

                              break;
                            case 'Syarat\nBooking':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const SyaratBookingPage()));

                              break;
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(4, 4),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                item['icon'],
                                width: 65,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              item['title'],
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
