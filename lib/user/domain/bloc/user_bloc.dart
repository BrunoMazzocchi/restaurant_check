import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:restaurant_check/user/domain/repository/user_security_repository.dart';

import '../models/user_model.dart';

class UserBloc extends Bloc {
  final UserSecurityRepository _userSecurityRepository = UserSecurityRepository();

  Future<int> fetchUserJwt(String email, password) {
    return _userSecurityRepository.fetchUserJwt(email, password);
  }

  Future<User?> fetchUser() {
    return _userSecurityRepository.fetchUser();
  }

  Future<int> logOutUser() {
    return _userSecurityRepository.logOutUser();
  }

  Future<int> isValid() {
    return _userSecurityRepository.isValid();
  }

  Future<bool> isUserLoggedIn(){
    return _userSecurityRepository.isUserLoggedIn();
  }
  @override
  void dispose() {
  }
}