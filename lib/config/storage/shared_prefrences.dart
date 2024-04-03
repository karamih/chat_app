import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class SharedPrefrencesStorage {
  late SharedPreferences prefs;

  Future<void> initStorage() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setAvatar(String avatarPath) async {
    prefs.setString('avatar', avatarPath);
  }

  void setUsername(String username) async {
    prefs.setString('username', username);
  }

  void setKey(String key) async {
    prefs.setString('key', key);
  }

  String getAvatar() {
    return prefs.getString('avatar') ?? Constants.avatar;
  }

  String getUsername() {
    return prefs.getString('username') ?? Constants.userName;
  }

  getKey() {
    return prefs.getString('key') ?? Constants.key;
  }

  bool getAccessToChat() {
    String? key = prefs.getString('key');
    return key != null;
  }

  Future<void> clear() async {
    prefs.clear();
  }
}
