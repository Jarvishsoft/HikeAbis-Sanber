import 'package:flutter/material.dart';
import 'package:hike_abis/ui/home-bottom/home_bottomnavbar.dart';

class PanduanBooking extends StatelessWidget {
  const PanduanBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Panduan Booking',
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
              const Center(
                child: Text(
                  'PANDUAN BOOKING ONLINE MOBILE PENDAKIAN GUNUNG',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.black87),
              const SizedBox(height: 15),
              const Text(
                '1. Booking Online                                                   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '◾ Buka aplikasi resmi Booking Online Pendakian Gunung di Aplikasi HikeAbis ini. \n◾ Pastikan kuota masih ada pada Menu Cek Kuota, dan tentukan jalur pendakian Anda. \n◾ Masuk pada menu Destinasi Wisata, dan pilih destinasi sesuai dengan jalur pendakian Anda, kemudian pilih “Booking Sekarang”. \n◾ Setujui persyaratan pendakian, membawa barang-barang yang ditentukan, serta bersedia menaati peraturan yang ada pada masing-masing gunung, kemudian klik “Daftar”. \n◾ Pilih tanggal pendakian dengan kuota yang masih tersedia, kemudian isi formulir pendakian dengan data yang sesuai. \n◾ Pastikan data sesuai dan valid! \n◾ Setelah data sudah sesuai, klik tombol “Hitung Biaya Tiket” untuk menampilkan biaya yang perlu di bayarkan nantinya pada basecamp pendakian dan informasi tambahan bagi Anda. \n◾ Jika sudah sesuai, klik “Proses”, kemudian Anda akan mendapatkan Kode OTP yang dikirimkan melalui Email Ketua Rombongan terdaftar. OTP akan aktif selama 5 menit, apabila Anda belum menginputkan OTP dalam waktu tersebut, maka booking Anda akan hangus dan silakan melakukan booking ulang. \n◾ Silakan isikan OTP pada kolom yang tersedia, klik “Konfirmasi”, kemudian Anda akan mendapatkan bukti booking melalui Email, mohon bukti ini disimpan dan ditunjukan pada petugas jalur pendakian saat hari pendakian. \n◾ Pastikan Anda memilih pembayaran dengan klik tombol “Lanjut ke Pembayaran” dan pilih pembayaran tunai. Apabila Anda belum memilih pembayaran dalam waktu 30 menit maka booking Anda akan hangus dan silakan melakukan booking ulang. \n◾ Pembayaran bisa dilakukan di basecamp pendakian pada hari H pendakian. \n◾ Pembayaran belum termasuk biaya Jasa wisata lokal, asuransi, dan pengelolaan basecamp. ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                '2. Perbarui Data Booking                                                   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '◾ Pembaruan data booking bisa dilakukan sebelum Anda melakukan pilihan pembayaran. Jika Anda sudah melakukan pilihan pembayaran, data booking sudah tidak bisa dirubah. \n◾ Buka halaman pada aplikasi resmi Booking Online Pendakian Gunung di Aplikasi HikeAbis ini. \n◾ Isikan kode booking Anda ke kolom “Cek Kode Booking”, kemudian klik “Cek”. \n◾ Akan muncul kolom isian Email. Silakan isikan email ketua rombongan terdaftar. Jika data valid, maka akan muncul data booking Anda. \n◾ Anda dapat menambah anggota (max 10 rombongan dan selama kuota tersedia). Dengan cara klik tombol “Tambah” yang berada di bawah list rombongan kemudian isikan nama dan NIK. \n◾ Jika ingin mengurangi anggota rombongan, silakan klik tanda “X” di sebelah kanan list anggota rombongan (min 3 rombongan). \n◾ Setelah data list rombongan ditambah/dikurangi, silakan klik tombol “Proses”, maka Anda akan mendapatkan Kode OTP yang dikirimkan melalui Email Ketua Rombongan terdaftar. \n◾ Silakan isikan OTP pada kolom yang tersedia, klik “Konfirmasi”, kemudian Anda akan mendapatkan bukti booking yang telah diperbarui melalui Email, mohon bukti ini disimpan dan ditunjukan pada petugas jalur pendakian saat hari pendakian. ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                '3. Pembatalan Booking                                                   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '◾ Pembatalan data booking bisa dilakukan sebelum Anda melakukan pembayaran. Jika Anda sudah melakukan pembayaran, data booking sudah tidak bisa dibatalkan. \n◾ Buka halaman pada aplikasi resmi Booking Online Pendakian Gunung di Aplikasi HikeAbis ini. \n◾ Isikan kode booking Anda ke kolom “Cek Kode Booking”, kemudian klik “Cek”. \n◾ Akan muncul kolom isian Email. Silakan isikan email ketua rombongan terdaftar. Jika data valid, maka akan muncul data booking Anda. \n◾ Silakan klik tombol “Batal Booking”, maka Anda akan mendapatkan Kode OTP yang dikirimkan melalui Email Ketua Rombongan terdaftar. \n◾ Silakan isikan OTP pada kolom yang tersedia, klik “Konfirmasi”, kemudian data booking Anda akan dibatalkan. Anda akan mendapatkan email informasi bahwa data booking Anda telah dibatalkan.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                '4. Mulai Pendakian                                                   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '◾ Lakukan pembayaran ke petugas jalur pendakian. \n◾ Anda akan mendapatkan booking tiket yang dikirimkan melalui email ketua rombongan. \n◾ Tunjukan Bukti Booking ke petugas jalur pendakian untuk dilakukan Scan QR Code dan validasi data. \n◾ Cek barang bawaan oleh petugas jalur pendakian. \n◾ Pendaki dipersilakan memulai pendakian. \n◾ Pembayaran belum termasuk biaya Jasa wisata lokal, asuransi, dan pengelolaan basecamp. ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                '5. Selesai Pendakian                                                   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '◾ Pastikan barang bawaan dan sampah dibawa turun bersama. \n◾ Setelah sampai pada pintu jalur pendakian, tunjukan bukti booking untuk dilakukan scan QR Code untuk pengecekan data anggota rombongan. \n◾ Cek barang bawaan oleh petugas jalur pendakian. \n◾ Pendaki dipersilakan untuk pulang.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                '** Peraturan ini dapat berubah sewaktu-waktu tergantung situasi dan kondisi pada masing-masing pertauran basecamp pada tiap gunung.\n** Pendaki WAJIB mentaati pada peraturan yang ada tanpa terkecuali apapun.',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 55),
              const Divider(color: Colors.black87),
              const SizedBox(height: 35),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 150, 137, 137),
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
                    letterSpacing: 1.8,
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
