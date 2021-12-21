import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body) {
  // 전달받은 body는 String 타입이 아닌 Json 형식 데이터이므로, utf8.decode 메소드를 활용하여
  // utf8 형식으로 변환할 수 없다. (한글깨짐 방지를 위해 utf8로 변경해야되는데 이게 불가능해짐)
  // utf8.decode메소드의 인자 값은 String 타입이어야 한다.

  // 그래서 jsonEncode메소드에 이미 Json타입인 body인자 값을 넣어서 String형으로 변경해주고
  // utf8 형식으로 변환한다.

  String responseBody = jsonEncode(body); // json 데이터로 변경
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return convertBody;
}
