import 'package:SmartQ/models/User.dart';
import 'package:SmartQ/repositories/userRepository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider with ChangeNotifier {
  SharedPreferences _prefs;
  final FirebaseAuth firebaseInstance = FirebaseAuth.instance;
  FirebaseUser user;
  bool _isAuth = false;

  bool get isAuth {
    return _isAuth;
  }

  Future<SharedPreferences> get prefs async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  //*functions*//
  Future<bool> login(String email, String password) async {
    try {
      AuthResult authResult = await firebaseInstance.signInWithEmailAndPassword(
          email: email, password: password);
      await this.saveUserData(email, password);
      this.user = authResult.user;
      this._isAuth = true;
      notifyListeners();
      return true;
    } catch (e) {
      Logger().e("couldnt authenticate due to : " + e.toString());
      return false;
    }
  }

  Future<bool> tryAutoLogin() async {
    SharedPreferences prefsInstance = await prefs;
    String email = await prefsInstance.getString('email');
    String password = await prefsInstance.getString('password');
    if (email != null && password != null)
      return await login(email, password);
    else
      return false;
  }

  Future<void> saveUserData(String email, String password) async {
    SharedPreferences prefsInstance = await prefs;
    await prefsInstance.setString('email', email);
    await prefsInstance.setString('password', password);
  }

  Future<void> logout() async {
    SharedPreferences prefsInstance = await prefs;
    await prefsInstance.remove('email');
    await prefsInstance.remove('password');
    this._isAuth = false;
    this.user = null;
    notifyListeners();
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      AuthResult authResult = await firebaseInstance
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = new User(id: authResult.user.uid, name: name, email: email);
      UserRepository().addUser(user);
      await this.saveUserData(email, password);
      this.user = authResult.user;
      this._isAuth = true;
      notifyListeners();
      return true;
    } catch (e) {
      Logger().e("couldnt register due to : " + e.toString());
      return false;
    }
  }
}
