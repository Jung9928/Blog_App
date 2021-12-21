import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final funValidator;
  final String? value; // null일 수도 아닌 값을 받을 수 도 있으니 ?사용하여 null-safe 처리
  final controller;

  const CustomTextFormField({
    required this.hint,
    required this.funValidator,
    this.value,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        initialValue: value ?? null, // null이라면 공백을 저장.
        validator: // funValidator함수를 외부에서 받는 이유는 CustomTextFormField의 값이 이메일 or 비밀번호 or 유저명이 될 수 있어서 검증해야 될 값이 다르기 때문에
            funValidator,
        obscureText: hint == "Password" ? true : false, // 비밀번호에만 비밀번호암호표시.
        decoration: InputDecoration(
          hintText: "Enter $hint", // hint가 null 값이어도 null-safe 하도록 $를 사용한다.
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            // 입력 필드 내 커서를 가장자리 가운데에 위치.
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            // 클라이언트가 입력한 정보를 유효성 검증하기 위해 사용.
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
