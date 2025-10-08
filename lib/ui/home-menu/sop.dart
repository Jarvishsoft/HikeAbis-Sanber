import 'package:flutter/material.dart';
import 'package:hike_abis/ui/home-bottom/home_bottomnavbar.dart';

class SOP extends StatefulWidget {
  const SOP({super.key});

  @override
  State<SOP> createState() => _SOPState();
}

class _SOPState extends State<SOP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'SOP | Standar Operasional Prosedur',
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
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    'SOP (Standar Operasional Prosedur) Pendakian Gunung',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(height: 10),
              const Text(
                'Bagi para pecinta alam, menikmati lukisan karya Tuhan dari ketinggian menjadi sesuatu hal yang sangat menarik. Potret keseruan dan gambaran keindahan pemandangan pegunungan menjadi impian para pendaki. \n\nSeorang pendaki harus menyiapkan beberapa hal seperti fisik, mental, dan intelegensi atau kemampuan untuk memecahkan masalah, beradaptasi dan belajar dari pengalaman, seperti :\n\n▪ Mengatur dan melatih kondisi fisik dan mental. \n▪ Melakukan riset tentang gunung yang menjadi tujuan, mulai dari jalur pendakian sampai kondisi dan situasi gunung tersebut. \n▪ Menyiapkan perbekalan, seperti peralatan sampai konsumsi.\n▪ Mencari informasi seputar transportasi.\n▪ Mengurus perizinan pendakian.\n▪ Dilarang melakukan pendakian diluar jalur yang sudah ditentukan oleh petugas alias Ilegal, apabila didapati pendaki dengan menggunakan jalur ilegal, maka akan dikenakan sanksi bersih gunung, atau denda maksimal 5 juta rupiah.\n▪ Kawasan Pelestarian Alam adalah kawasan dengan ciri khas tertentu, baik di darat maupun di perairan yang mempunyai fungsi perlindungan sistem penyangga kehidupan, pengawetan keanekaragaman jenis tumbuhan dan satwa, serta pemanfaatan secara lestari sumber daya alam hayati dan ekosistemnya.\n▪ Taman Nasional adalah kawasan pelestarian alam yang mempunyai ekosistem asli, dikelola dengan sistem zonasi yang dimanfaatkan untuk tujuan penelitian, ilmu pengetahuan, pendidikan, menunjang budidaya, pariwisata dan rekreasi.\n▪ SDA (Sumber Daya Alam) hayati adalah unsur-unsur hayati di alam yang terdiri dari sumber daya alam nabati (tumbuhan) dan sumber daya alam hewani (satwa) yang bersama dengan unsur non hayati di sekitarnya secara keseluruhan membentuk ekosistem.\n▪ Wisata Alam adalah kegiatan perjalanan atau sebagian dari kegiatan tersebut yang dilakukan secara sukarela serta bersifat sementara untuk menikmati gejala keunikan dan keindahan alam di kawasan suaka margasatwa, taman nasional, taman hutan raya, dan taman wisata alam.\n▪ Pendakian Gunung adalah olahraga, profesi dan rekreasi wisata alam bertujuan untuk menggapai tempat-tempat tertinggi untuk menikmati keindahan alam.\n Pendakian di Gunung ini adalah kegiatan pendakian gunung melalui jalur yang telah ditentukan oleh Balai Besar Gunung masing-masing.\n▪ Jalur pendakian adalah bagian jalan yang dipergunakan untuk aktivitas mendaki, biasanya ditandai dari bagian jalan yang dibersihkan dan diperkeras serta dipelihara.\n▪ Kemah adalah meletakkan, membangun tenda atau struktur berbentuk tenda dipergunakan untuk berteduh atau menginap.\n▪ Pintu masuk pendakian adalah pintu resmi yang telah ditetapkan oleh pengelola kawasan.\n▪ Kantor pengelola adalah sarana yang berfungsi sebagai fasilitas kegiatan pengelolaan pendakian.\n▪ Pos lapor ulang adalah fasilitas untuk melaku-kan pengecekan ulang bagi para pendaki.\n▪ Poskodal Pendakian adalah Pos Komando dan Pengendalian Pendakian yang berfungsi sebagai pemantau segala aktivitas pendakian.\n▪ Pendaki Pendakian adalah orang yang melakukan kegiatan pendakian Gunung melalui prosedur yang telah ditetapkan.\n▪ Pemandu/Interpreter adalah orang yang menyampaikan informasi alam/lingkungan/ hutan kepada pendaki sehingga menjadi jembatan antara keduanya yang pada akhirnya akan menumbuhkan kepedulian, pemahaman dan penyadaran terhadap pentingnya alam lingkungan/hutan tersebut.\n▪ Porter adalah orang-orang yang dibayar untuk membantu membawa barang-barang para pendaki pada saat melakukan aktivitas pendakian gunung. Seringkali porter juga bertugas untuk menyiapkan makanan pada saat pendakian.\n▪ Penutupan Pendakian adalah kebijakan menutup semua bentuk aktivitas pendakian ke Gunung yang ditetapkan oleh Kepala Balai Besar.\n▪ Pemulihan/Recovery ekosistem adalah upaya perbaikan ekosistem dari kondisi rusak ke kondisi awal/baik secara alami maupun dengan campur tangan manusia.\n▪ Sistem Booking Online adalah pendaftaran dan pembayaran karcis masuk untuk kegiatan pendakian gunung Semeru oleh para calon pendaki secara online.\n▪ Kuota adalah batasan maksimum ukuran dan satuan jumlah pendaki yang telah ditetapkan oleh pengelola kawasan.\n▪ Vandalisme adalah salah satu tindakan perusakan fasilitas wisata alam, mencoret-coret/melukai pohon, batu, dan lain-lain.\n▪ Virtual Account adalah adalah rekening tidak nyata (virtual), berisikan nomor ID customer yang dibuat Bank (sesuai permintaan perusahaan) untuk melakukan transaksi. Setiap satu transaksi, customer akan mendapatkan satu nomor ID Virtual Account yang disebut Virtual Account Number, ketika membayar tagihan melalui Virtual Account maka konfirmasi pembayaran akan berlangsung otomatis.',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 15),
              const Text(
                'Maksud penyusunan Standar Operasional Prosedur (SOP) Pendakian Gunung pada masa Adaptasi Kebiasaan Baru ini adalah sebagai salah satu upaya untuk meningkatkan keselamatan dan kenyamanan pendaki serta menjaga kelestarian keanekaragaman hayati dan ekosistem Gunung, dan sebagai pedoman atau aturan pelaksanaan /penyelenggaraan pendakian gunung.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  '"Mendaki gunung bukan tentang menaklukan, melainkan mengetahui kapasitas, kapabilitas, dan ketahanan diri sendiri"',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(color: Colors.black87),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(150, 137, 137, 1),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HomeBottomnavbar()),
                      (_) => false);
                },
                child: const Text(
                  'Setuju & Kembali',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 1.8),
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
