class CMRespDto {
  final int? code;
  final String? msg;
  final dynamic data;

  CMRespDto({
    this.code,
    this.msg,
    this.data,
  });

  // 통신을 위해서 json와 같은 형식의 문자열 {"id" : 1} => Dart 객체로 변환
  CMRespDto.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
