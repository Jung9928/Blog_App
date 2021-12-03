import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_form_field.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class JoinPage extends StatelessWidget {
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
                "회원가입 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  // 부모타입은 최상위 부모타입인 위젯으로 잡아주면 좋다. (화면 아래 키보드가 올라와도 overflow 문제 발생x)
  Widget _joinForm() {
    return Form(
      key:
          _formKey, // Form 위젯 내부는 formKey를 등록했기 때문에 해당 formKey를 통해 어디서든지 컨트롤할 수 있음.
      // 이름, 비밀번호, 이메일 데이터를 Spring 서버로 한번에 전송하고 유효성 검증까지 하기위해서 Form위젯 사용
      child: Column(
        children: [
          CustomTextFormField(
            hint: "Username",
            funValidator: validateUserame(),
          ),
          CustomTextFormField(
            hint: "Password",
            funValidator:
                validatePassword(), // value 값은 formfield에서 값을 입력하고 로그인 or 회원가입 버튼을 누르면 value에 입력값이 저장됨.
          ),
          CustomTextFormField(
            hint: "Email",
            funValidator: validateEmail(),
          ),
          CustomElevatedButton(
            text: "회원가입",
            funPageRoute: () {
              // !를 사용하여 절대 null값이 될 수 없음을 지정. 그리고 버튼 클릭 시, validate가 실행되어 value값에 입력한 값이 저장.
              if (_formKey.currentState!.validate()) {
                // 유효성 검증을 통과하면 이동.
                Get.to(LoginPage());
              }
            },
          ),
        ],
      ),
    );
  }
}
