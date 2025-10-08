import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final gKey = GlobalKey<FormState>();
  final namaC = TextEditingController();
  final telpC = TextEditingController();
  final nikC = TextEditingController();
  final ttlC = TextEditingController();
  final passLamaC = TextEditingController();
  final passBaruC = TextEditingController();
  final passKonfC = TextEditingController();
  bool isObscure = true;
  bool isKonfObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Edit Profil',
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
      body: Form(
        key: gKey,
        child: ListView(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/hikeabis_logo.png'),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ubah Foto Profil',
                      style: TextStyle(fontSize: 12),
                    )),
                TextFormField(
                  controller: namaC,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text('Nama'),
                    labelStyle: const TextStyle(fontSize: 13),
                    hintText: 'Masukkan nama lengkap kamu',
                    hintStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: telpC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor telepon tidak boleh kosong';
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text('Nomor Telepon'),
                    hintText: 'Masukkan nomor telepon kamu',
                    hintStyle: const TextStyle(fontSize: 13),
                    labelStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: nikC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIK tidak boleh kosong';
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text('NIK (Nomor Induk Kependudukan)'),
                    hintText: 'Masukkan NIK kamu',
                    hintStyle: const TextStyle(fontSize: 13),
                    labelStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: ttlC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'TTL tidak boleh kosong';
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text('Tempat, Tanggal Lahir'),
                    hintText: 'Masukkan TTL kamu',
                    hintStyle: const TextStyle(fontSize: 13),
                    labelStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isObscure,
                  controller: passLamaC,
                  decoration: InputDecoration(
                    label: const Text('Password Lama'),
                    labelStyle: const TextStyle(fontSize: 13),
                    hintText: 'Masukkan password lama kamu',
                    hintStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isObscure,
                  controller: passBaruC,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          size: 16,
                          color: Colors.black.withOpacity(0.25),
                        )),
                    label: const Text('Password Baru'),
                    labelStyle: const TextStyle(fontSize: 13),
                    hintText: 'Masukkan password baru kamu',
                    hintStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: isKonfObscure,
                  controller: passKonfC,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isKonfObscure = !isKonfObscure;
                          });
                        },
                        icon: Icon(
                          isKonfObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 16,
                          color: Colors.black.withOpacity(0.25),
                        )),
                    label: const Text('Konfirmasi Password Baru'),
                    labelStyle: const TextStyle(fontSize: 13),
                    hintText: 'Konfirmasi password baru kamu',
                    hintStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 70,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              print('Button clicked');
              if (gKey.currentState!.validate()) {
                // --- logic save ---
              }
              if (passBaruC.text != passKonfC.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Password baru tidak sama, silakan cek kembali')),
                );
              }
            },
            child: Text(
              'Simpan',
              style: TextStyle(color: Colors.white, letterSpacing: 1),
            )),
      ),
    );
  }
}
