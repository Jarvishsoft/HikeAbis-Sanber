import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hike_abis/authentication/login_page.dart';
import 'package:hike_abis/providers/auth_provider.dart';
import 'package:hike_abis/ui/home-bottom/home_bottomnavbar.dart';
import 'package:provider/provider.dart';

import '../widgets/cust_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      // Jika validasi sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Loading...')),
      );
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const LoginPage()), (_) => false);
    } else {
      // Jika validasi gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form tidak boleh kosong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, resultState, _) {
      return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: <Widget>[
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/hikeabis_logo.png',
                    width: 160,
                    height: 160,
                  ),
                ),
                const Text(
                  "Selamat Datang,",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Daftar untuk memulai petualanganmu!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  controller: _nameController,
                  hintText: 'Masukkan nama lengkap kamu',
                  prefixIcon: const Icon(Icons.person_outline),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  controller: _userController,
                  hintText: 'Masukkan username kamu',
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  controller: _emailController,
                  hintText: 'contoh@email.com',
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    final isEmailValidation = EmailValidator.validate(value);
                    if (!isEmailValidation) {
                      return 'Silakan masukkan email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.75),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                    controller: _passwordController,
                    hintText: 'Buat password kamu',
                    prefixIcon: const Icon(Icons.lock),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'Password setidaknya 6 karakter';
                      }
                      return null;
                    },
                    passwordMode: true),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF5AC0FF),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  onPressed: () async {
                    _validateForm();
                    //   setState(() {
                    //     isLoading = true;
                    //   });

                    //   if (await resultState.register(
                    //     name: _nameController.text,
                    //     username: _userController.text,
                    //     email: _emailController.text,
                    //     password: _passwordController.text,
                    //   )) {
                    //     Get.to(() => const LoginPage());
                    //   } else {
                    //     // ignore: use_build_context_synchronously
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(
                    //         backgroundColor: Colors.red,
                    //         content: Text(
                    //           'Gagal Register! | Gunakan username atau email lain',
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //     );
                    //   }

                    //   setState(() {
                    //     isLoading = false;
                    //   });
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sudah memilik akun?",
                      style: TextStyle(color: Colors.black.withOpacity(0.75)),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HomeBottomnavbar()),
                          (_) => false),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}






// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hikeabis_app/data/authentication/signup.dart';

// class LoginRegister extends StatefulWidget {
//   const LoginRegister({super.key});

//   @override
//   State<LoginRegister> createState() => _LoginRegisterState();
// }

// class _LoginRegisterState extends State<LoginRegister> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           // Gambar latar belakang yang memenuhi seluruh layar
//           Container(
//             decoration: const BoxDecoration(
//                 // image: DecorationImage(
//                 //   image: AssetImage('assets/bg.JPG'),
//                 //   fit: BoxFit.cover,
//                 // ),
//                 ),
//           ),
//           // Konten tengah dengan logo dan tombol
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // logo aplikasi
//                 Image.asset(
//                   'assets/hikeabis_logo.png',
//                   width: 300,
//                   height: 300,
//                 ),
//                 const SizedBox(height: 10),
//                 const Center(
//                   child: Text(
//                     'Your best partner in summits travel',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 ElevatedButton(
//                   onPressed: () {
//                     // Aksi ketika tombol "Login" ditekan
//                     Get.to(const SignUp());
//                   },
//                   child: const Text('Sign Up'),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Aksi ketika tombol "Register" ditekan
//                   },
//                   child: const Text('Login'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }