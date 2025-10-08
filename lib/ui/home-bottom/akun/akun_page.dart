import 'package:flutter/material.dart';
import 'package:hike_abis/authentication/login_page.dart';
import 'package:hike_abis/providers/auth_provider.dart';
import 'package:hike_abis/theme/theme.dart';
import 'package:hike_abis/ui/home-bottom/akun/edit_profile.dart';
import 'package:hike_abis/ui/home-bottom/akun/faq.dart';
import 'package:hike_abis/widgets/profil_list.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  void logout() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Apakah kamu yakin untuk keluar?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Terima kasih telah menggunakan aplikasi kami!')));
                  },
                  child: const Text(
                    'Keluar',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Batal',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          );
        });
  }

  Future<void> chatAdmin(BuildContext context) async {
    try {
      final Uri url = Uri.parse(
          'https://wa.me/6281327408189?text=Halo%20Admin,%20saya%20butuh%20bantuan');
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Membuka di aplikasi WhatsApp
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Loading...')));
    } catch (e) {
      // Menangani error yang tidak terduga
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, resultState, _) {
      // UserModel? user = resultState.user;
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: appBarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/hikeabis_logo.png',
                  scale: 6,
                ),
              ),
              const SizedBox(height: 20),
              // Text('Name : ${user!.name}'),
              const Text(
                'User',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              // Text('Email : ${user.email}'),
              const Text(
                'user@email.com',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Divider(),
              ProfilList(
                title: 'Edit Profil',
                icon: Icons.edit,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const EditProfile()));
                },
              ),
              ProfilList(
                title: 'FAQ ',
                icon: Icons.chat_bubble_outline_rounded,
                ontap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const FAQ()));
                },
              ),
              ProfilList(
                title: 'Chat Admin Hike Abis | WhatsApp',
                icon: Icons.title,
                ontap: () {
                  chatAdmin(context);
                },
              ),
              ProfilList(
                title: 'Logout',
                icon: Icons.logout_rounded,
                ontap: () {
                  logout();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
