import 'package:flutter_blog/domain/user/user.dart';
import 'package:intl/intl.dart';

class Post {
  final int? id;
  final String? title;
  final String? content;
  final User? user;
  final DateTime? created;
  final DateTime? updated;

  Post(
      {this.id,
      this.title,
      this.content,
      this.user,
      this.created,
      this.updated});

  // 통신을 위해서 json와 같은 형식의 문자열 {"id" : 1} => Dart 객체로 변환
  // 외부에서 전송받은 json 타입의 데이터를 받아서 Dart 타입 객체에 저장.
  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["username"],
        content = json["email"],
        user = User.fromJson(json["user"]),
        created = DateFormat("yyyy-mm-dd").parse(json["created"]),
        updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);
}
