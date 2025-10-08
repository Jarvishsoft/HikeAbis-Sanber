import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hike_abis/authentication/register_page.dart';
import 'package:hike_abis/providers/auth_provider.dart';
import 'package:hike_abis/ui/home-bottom/home_bottomnavbar.dart';
import 'package:hike_abis/widgets/cust_form.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCont = TextEditingController();
  final _passwordCont = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _emailCont.dispose();
    _passwordCont.dispose();
    super.dispose();
  }

  Future<void> _handleLogin(AuthProvider auth) async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      final success = await auth.login(
        email: _emailCont.text.trim(),
        password: _passwordCont.text.trim(),
      );

      setState(() => isLoading = false);

      if (success) {
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomeBottomnavbar()),
          (_) => false,
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Gagal Login | Email atau password salah!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Form tidak valid!\nHarap cek email dan password kamu kembali.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
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
                      width: 180,
                      height: 180,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Selamat Datang di Hike Abis,',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Masuk untuk mulai pendakian!',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Email
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    controller: _emailCont,
                    hintText: 'contoh@email.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Silakan masukkan email yang valid';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Password
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    controller: _passwordCont,
                    hintText: 'Masukkan password kamu',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    keyboardType: TextInputType.visiblePassword,
                    passwordMode: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'Password setidaknya 6 karakter';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Tombol Login
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF5AC0FF),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed:
                        isLoading ? null : () => _handleLogin(authProvider),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                  ),

                  const SizedBox(height: 10),

                  // Link ke Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Belum memiliki akun?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterPage(),
                            ),
                            (_) => false,
                          );
                        },
                        child: const Text(
                          'Daftar',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
