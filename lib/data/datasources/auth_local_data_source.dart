import 'package:hive/hive.dart';

class AuthLocalDataSource {
  final Box<String> authBox;

  AuthLocalDataSource(this.authBox);

  saveLoginInfo(String id) {
    try {
      authBox.putAt(0, id);
    } catch (_) {
      authBox.add(id);
    }
  }

  String? loggedId() {
    try {
      return authBox.getAt(0);
    } catch (_) {
      return null;
    }
  }

  removeLoginInfo() {
    try {
      authBox.deleteAt(0);
    } catch (_) {}
  }
}
