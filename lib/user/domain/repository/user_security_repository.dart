import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../providers/user_security_provider.dart';
import '../models/user_model.dart';

class UserSecurityRepository {
  late int statusCode; // 200 = OK, 404 = Not Found, 500 = Internal Server Error
  final UserSecurityProvider _userSecurityProvider = UserSecurityProvider();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  DateTime now = DateTime.now();



  Future<int> fetchUserJwt(String email, password) async {
    try {
      statusCode = await _userSecurityProvider.fetchUserJwt(email, password);
      if (statusCode == 200) {
        return 200;
      } else {
        return 401;
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error Stacktrace: $stacktrace");

      throw Exception('Failed to load token');
    }
  }

  Future<int> isValid() async {
    await storage.delete(key: 'jwt');
    if(await storage.read(key: 'jwt') != null) {
      return 200;
    } else {
      return 401;
    }
  }

  Future<User?> fetchUser() async {
    return await _userSecurityProvider.fetchUser();
  }

  Future<int> logOutUser() async {
    return await _userSecurityProvider.logOut();
  }

  Future<bool> isUserLoggedIn() {
    return _userSecurityProvider.isUserLoggedIn();
  }
}
