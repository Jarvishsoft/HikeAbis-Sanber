import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hike_abis/models/order_model/order_model.dart';
import 'package:hike_abis/providers/order_provider.dart';
import 'package:hike_abis/ui/home-bottom/home_bottomnavbar.dart';
import 'package:hike_abis/widgets/cust_form.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _noTelp = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _usia = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  bool isCheck = false;

  @override
  void dispose() {
    _nama.dispose();
    _alamat.dispose();
    _email.dispose();
    _nik.dispose();
    _usia.dispose();
    _noTelp.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  void confirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          icon: const Icon(
            Icons.check_circle_outline_rounded,
            size: 72,
            color: Colors.green,
          ),
          title: const Text(
            'SUKSES!',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: const Text(
            'Booking Anda telah berhasil, silakan melakukan pembayaran yaa',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeBottomnavbar()),
                    (_) => false);
              },
              child: const Center(
                child: Text(
                  'OKE',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Booking Online',
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    'INFORMASI BOOKING',
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
                'Harga Tiket Wisatawan Lokal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Weekdays  : Rp. 35.000,-\'\nWeekend   : Rp. 40.000,-\'\nAktifitas     : Rp. 25.000,-\'',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
              const Text(
                'Harga Tiket Wisatawan Asing\n(Foreign Tourist Ticket Prices)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Weekdays  : \$ 35.00\nWeekend   : \$ 40.00\nActivity      : \$ 25.00',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '* Simaksi tertera hanya diperuntukkan tiket PNBP.\n* Harga simaksi dapat berubah sewaktu-waktu.\n* Belum termasuk biaya jasa wisata lokal, asuransi, & biaya pengelolaan basecamp.',
                    style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'Nama Pendaki',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _nama,
                          hintText: 'Masukkan nama kamu',
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan nama kamu terlebih dahulu';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'NIK Pendaki',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _nik,
                          hintText: 'Masukkan NIK kamu',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'NIK tidak boleh kosong';
                            }
                            if (value.length != 16) {
                              return 'NIK harus terdiri dari 16 angka';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'NIK hanya boleh mengandung angka';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'No. Telp',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _noTelp,
                          hintText: 'Masukkan No. Telp kamu',
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nomor telepon tidak boleh kosong';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Nomor telepon hanya boleh mengandung angka';
                            }
                            if (value.length < 10 || value.length > 15) {
                              return 'Nomor telepon harus terdiri dari 10-15 angka';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _email,
                          hintText: 'Masukkan email yang valid',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan email kamu yang valid';
                            }
                            final isEmailValidation =
                                EmailValidator.validate(value);
                            if (!isEmailValidation) {
                              return 'Masukkan email yang valid';
                            }
                            return null;
                          },
                        ),
                        const Text(
                          '* Harap masukkan email yang valid. Order akan dikirimkan ke email kamu',
                          style: TextStyle(
                              fontSize: 10, fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Usia',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _usia,
                          hintText: 'Usia kamu',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan usia kamu dulu';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Usia hanya boleh mengandung angka.';
                            }
                            int age = int.parse(value);
                            if (age < 1) {
                              return 'Usia harus lebih besar dari 0.';
                            }
                            if (age > 120) {
                              return 'Usia tidak boleh lebih dari 120.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Alamat (sesuai KTP)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                          controller: _alamat,
                          hintText: 'Alamat sesuai KTP kamu',
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Alamat tidak boleh kosong';
                            }
                            if (value.length < 10) {
                              return 'Alamat harus memiliki minimal 10 karakter.';
                            }
                            if (!RegExp(r'^[a-zA-Z0-9\s,.-]+$')
                                .hasMatch(value)) {
                              return 'Alamat hanya boleh mengandung huruf, angka, spasi, koma, titik, atau tanda hubung.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        const Divider(color: Colors.black54),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isCheck,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheck = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 10,
                      ),
                      child: Text(
                          'Saya sanggup mengikuti dan mematuhi semua peraturan yang telah diterapkan dan ditentukan pada yang telah tertera dan pada masing-masing basecamp gunung yang akan dituju untuk pendakian, dan akan bertanggungjawab serta menerima sanksi apabila didapati melanggar peraturan.'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 150, 137, 137),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (isCheck) {
                      setState(
                        () {
                          String nama = _nama.text;
                          String nik = _nik.text;
                          String noTelp = _noTelp.text;
                          String email = _email.text;
                          String usia = _usia.text;
                          String alamat = _alamat.text;

                          if (nama.isNotEmpty &&
                              nik.isNotEmpty &&
                              noTelp.isNotEmpty &&
                              email.isNotEmpty &&
                              usia.isNotEmpty &&
                              alamat.isNotEmpty) {
                            Provider.of<OrderProvider>(context, listen: false)
                                .addOrderModels(
                              OrderModels(
                                nama: _nama.text,
                                nik: _nik.text,
                                noTelp: _noTelp.text,
                                email: _email.text,
                                usia: _usia.text,
                                alamat: _alamat.text,
                              ),
                            );
                            confirmDialog();
                            _nama.clear();
                            _nik.clear();
                            _noTelp.clear();
                            _email.clear();
                            _usia.clear();
                            _alamat.clear();
                          }
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            title: const Text(
                              'Validasi Gagal!',
                              style: TextStyle(
                                // fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: const Text(
                                'Harap setujui peraturan terlebih dahulu yaa.'),
                            shadowColor: Colors.black12,
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'OKE',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              const SizedBox(height: 60),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Mohon isi form terlebih dahulu!')));
                  }
                },
                child: const Text(
                  'Setuju & Tambah Booking',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.25,
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
