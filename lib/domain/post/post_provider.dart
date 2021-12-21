import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

const host = ""; // 내 컴퓨터의 실제 ip를 입력. ch.24

// 실제로 통신을 수행하는 역할
class PostProvider extends GetConnect {
  // JavaScript의 Promise 개념과 동일 (비동기 처리)

  Future<Response> findAll() =>
      get("$host/post", headers: {"Authorization": jwtToken ?? ""});
}
