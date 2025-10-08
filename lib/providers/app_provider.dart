import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';
import 'berita_provider.dart';
import 'gunung_provider.dart';
import 'kuota_provider.dart';
import 'order_provider.dart';

class AppProviders {
  static MultiProvider init({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => GunungProvider()),
        ChangeNotifierProvider(create: (_) => KuotaProvider()),
        ChangeNotifierProvider(create: (_) => BeritaProvider()),
      ],
      child: child,
    );
  }
}
