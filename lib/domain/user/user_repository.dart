import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

// 통신을 통해 응답되는 데이터를 가공하는 역할. json => dart 객체
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<String> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print(loginReqDto.toJson());
    // user_provider에서 post 호출 시, 통신 딜레이로 인해 첫 값은 null을 받으므로
    // 그 다음 값인 data를 받을 때까지는 대기하도록 await 설정
    Response response = await _userProvider
        .login(loginReqDto.toJson()); // Map형식의 데이터(data)를 전달.

    dynamic headers = response.headers;

    if (headers["authorization"] == null) {
      return "-1";
    } else {
      String token = headers["authorization"];
      return token;
    }
    String token = headers["authorization"];
    return token;
  }
}
