import 'package:flutter/material.dart';
import 'package:hike_abis/models/user_model/user_model.dart';
import 'package:hike_abis/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );
      _user = user;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint("Register error: $e");
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint("Login error: $e");
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Simpan user ke SharedPreferences
  Map<String, dynamic>? saveUserToPref() {
    if (_user != null) {
      return _user!.toJson();
    }
    return null;
  }

  // Ambil user dari SharedPreferences
  void loadUserFromPref(Map<String, dynamic> json) {
    _user = UserModel.fromPref(json);
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
