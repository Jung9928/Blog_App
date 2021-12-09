import 'package:validators/validators.dart';

Function validateUserame() {
  return (String? value) {
    if (value!.isEmpty) {
      // 한글이 포함되어 있다면
      return "Username에 공백이 포함될 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      // 공백이 포함되어 있다면
      return "Username에 한글 또는 특수문자는 포함될 수 없습니다";
    } else if (value.length > 12) {
      return "Username의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "Username은 최소 4자 이상 입력하셔야 합니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      // 한글이 포함되어 있다면
      return "Password에 공백이 포함될 수 없습니다.";
    } else if (value.length > 12) {
      return "Password의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "Password는 최소 4자 이상 입력하셔야 합니다.";
    } else {
      // 정상일 경우
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      // 한글이 포함되어 있다면
      return "이메일에는 공백이 포함될 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      // 한글이 포함되어 있다면
      return "제목에는 공백이 포함될 수 없습니다.";
    } else if (value.length > 30) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      // 한글이 포함되어 있다면
      return "내용에는 공백이 포함될 수 없습니다.";
    } else if (value.length > 500) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}
