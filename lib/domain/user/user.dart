import 'package:intl/intl.dart';

class User {
  final int? id;
  final String? username;
  final String? email;
  final DateTime? created;
  final DateTime? updated;

  User({this.id, this.username, this.email, this.created, this.updated});

  // 통신을 위해서 json와 같은 형식의 문자열 {"id" : 1} => Dart 객체로 변환
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        email = json["email"],
        created = DateFormat("yyyy-mm-dd").parse(json["created"]),
        updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);
}
