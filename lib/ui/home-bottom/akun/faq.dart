import 'package:flutter/material.dart';
import 'package:hike_abis/ui/home-bottom/home_bottomnavbar.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'FAQ - HIKE ABIS',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  'FAQ (Frequently Asked Questions)',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black87),
              const SizedBox(height: 15),
              const Text(
                '1. Apa itu aplikasi ini?                                                   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Aplikasi ini adalah platform untuk memesan tiket pendakian gunung secara online, memberikan kemudahan bagi pendaki untuk mengelola jadwal, memesan tiket, dan mendapatkan informasi lengkap tentang pendakian.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '2. Apa saja fitur yang tersedia di aplikasi ini?                                                   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Fitur utama aplikasi ini meliputi : \n◾ Pemesanan tiket pendakian.\n◾ Informasi lengkap tentang gunung, jalur pendakian, dan aturan. \n◾ Jadwal pendakian yang dapat disesuaikan.\n◾ Notifikasi pengingat untuk jadwal pendakian.\n◾ Dukungan pelanggan 24/7.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '3. Bagaimana cara memesan tiket pendakian?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '◾ Masuk ke aplikasi.\n◾ Pilih gunung yang ingin didaki.\n◾ Tentukan tanggal pendakian dan jumlah pendaki.\n◾ Masukkan data pendaki sesuai ketentuan.\n◾ Lakukan pembayaran melalui metode yang tersedia.\n◾ Setelah pembayaran berhasil, e-tiket akan dikirim ke email Anda.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '4. Apa saja metode pembayaran yang didukung?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Aplikasi ini mendukung berbagai metode pembayaran, termasuk :\n◾ Transfer bank.\n◾ Dompet digital (OVO, GoPay, DANA, dsb.).\n◾ Kartu kredit/debit.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '9. Apakah aplikasi ini menyediakan panduan pendakian?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Kebijakan pembatalan dan penjadwalan ulang bergantung pada ketentuan masing-masing pengelola gunung. Silakan periksa detail kebijakan saat melakukan pemesanan atau hubungi tim dukungan pelanggan.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '6. Apakah tiket yang sudah dibeli dapat dibatalkan atau dijadwalkan ulang?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ya, Anda perlu membuat akun untuk memesan tiket. Hal ini bertujuan agar kami dapat menyimpan riwayat pemesanan dan memberikan informasi yang relevan.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '7. Apakah ada biaya tambahan saat memesan tiket?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Biaya tambahan mungkin berlaku seperti biaya administrasi atau pajak tertentu. Semua biaya akan ditampilkan secara transparan sebelum Anda melakukan pembayaran.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '8. Bagaimana jika saya mengalami masalah saat memesan tiket?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Anda dapat menghubungi tim dukungan pelanggan kami melalui :\n◾ Email: support@ticketgunung.com\n◾ WhatsApp: +62 812-3206-7890\n◾ Fitur live chat di dalam aplikasi.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '9. Apakah aplikasi ini menyediakan panduan pendakian?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ya, aplikasi ini menyediakan panduan pendakian seperti informasi jalur, perlengkapan yang disarankan, dan aturan pendakian. Informasi ini tersedia di halaman detail gunung.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '10. Bagaimana jika saya tidak menerima e-tiket setelah pembayaran?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Jika Anda tidak menerima e-tiket, pastikan untuk :\n◾ Memeriksa folder spam di email Anda.\n◾ Mengonfirmasi bahwa pembayaran Anda telah berhasil.\n◾ Hubungi dukungan pelanggan untuk bantuan lebih lanjut.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '11. Apakah data pribadi saya aman di aplikasi ini?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ya, kami menggunakan enkripsi dan protokol keamanan terkini untuk melindungi data pribadi Anda. Data Anda hanya digunakan untuk keperluan pemesanan dan tidak akan dibagikan tanpa izin Anda.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '12. Apakah aplikasi ini mendukung pendakian kelompok?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ya, Anda dapat memesan tiket untuk kelompok dengan mengisi data semua anggota kelompok saat proses pemesanan.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '13. Apakah aplikasi ini tersedia untuk semua jenis perangkat?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Aplikasi ini tersedia untuk perangkat Android dan iOS. Anda dapat mengunduhnya melalui Google Play Store dan Apple App Store.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '14. Bagaimana jika saya lupa kata sandi akun saya?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Anda dapat menggunakan fitur "Lupa Kata Sandi" di halaman masuk. Kami akan mengirimkan tautan pemulihan ke email Anda.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '15. Apakah aplikasi ini mendukung reservasi di semua gunung?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Aplikasi ini mendukung gunung-gunung yang telah bekerja sama dengan kami. Daftar gunung akan terus diperbarui sesuai dengan perkembangan kerja sama kami.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.black87),
              const SizedBox(height: 35),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 150, 137, 137),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Setuju & Kembali',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 1.8,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
