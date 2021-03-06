import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin =
      false.obs; // UI가 관찰 가능한 변수 => 변경 => UI가 자동 업데이트 (Observer 패턴)

  // 로그아웃 시, 호출
  void logout() {
    isLogin.value = false;
    jwtToken = null;
  }

  Future<String> login(String username, String password) async {
    String token = await _userRepository.login(username, password);

    if (token != "-1") {
      isLogin.value = true;
      jwtToken = token;
      print("jwtToken : $jwtToken");
    }
    jwtToken = token;
    print("jwtToken : $jwtToken");
    return token;
  }
}
