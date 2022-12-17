import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../provider/user_security_provider.dart';

class UserSecurityRepository {
  late int statusCode; // 200 = OK, 404 = Not Found, 500 = Internal Server Error
  final UserSecurityProvider _userSecurityProvider = UserSecurityProvider();

  Future<int> getUserSecurity(String email, password) async {
    return await _userSecurityProvider.fetchUserJwt(email, password);
  }

  Future<int> checkSecurityData(String email, String password) async {
    const storage = FlutterSecureStorage();
    final String jwt = await storage.read(key: 'jwt') ?? '';
    final String exp = await storage.read(key: 'expiryDuration') ?? '';
    final now = DateTime.now().second;
    if (jwt != '' && exp != '' && int.parse(exp) > now) {
      return 200;
    } else {
      return await _userSecurityProvider
          .fetchUserJwt(email, password)
          .then((value) {
        statusCode = value;
        switch (statusCode) {
          case 200:
            return 200;
          case 401:
            return 401;
        }
        return statusCode;
      });
    } // 200 = OK, 404 = Not Found, 500 = Internal Server Error

  }
}
