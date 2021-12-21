import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get_connect/http/src/response/response.dart';

// 통신을 통해 응답되는 데이터를 가공하는 역할. json => dart 객체
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = await response.body;
    dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    //print(cmRespDto.code);
    //print(cmRespDto.msg);
    //print(cmRespDto.data.runtimeType); // 런타임 때 타입을 지정.

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[]; // 빈 배열 반환
    }
  }
}
