import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_form_field.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // form상태를 관리하는 key.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "로그인 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  // 부모타입은 최상위 부모타입인 위젯으로 잡아주면 좋다. (화면 아래 키보드가 올라와도 overflow 문제 발생x)
  Widget _loginForm() {
    return Form(
      key: _formKey,
      // 이름, 비밀번호, 이메일 데이터를 Spring 서버로 한번에 전송하고 유효성 검증까지 하기위해서 Form위젯 사용
      child: Column(
        children: [
          CustomTextFormField(
            hint: "Username",
            funValidator: (value) {},
          ),
          CustomTextFormField(
            hint: "Password",
            funValidator: (value) {},
          ),
          CustomElevatedButton(
              text: "로그인", funPageRoute: () => Get.to(HomePage())),
        ],
      ),
    );
  }
}
