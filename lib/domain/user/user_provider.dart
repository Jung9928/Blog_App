import 'package:get/get.dart';

const host = ""; // 내 컴퓨터의 실제 ip를 입력. ch.24

// 실제로 통신을 수행하는 역할
class UserProvider extends GetConnect {
  // JavaScript의 Promise 개념과 동일 (비동기 처리)
  // post를 호출하는 즉시, null이 전송됨. 그 다음 data가 전달된다.
  Future<Response> login(Map data) => post("$host/login", data);
}
