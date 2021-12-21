import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/user/join_page.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // form상태를 관리하는 key.
  final UserController u = Get.put(UserController());

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                "로그인 페이지 ${u.isLogin}",
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
            controller: _username,
            hint: "Username",
            funValidator: validateUserame(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () async {
              // !를 사용하여 절대 null값이 될 수 없음을 지정. 그리고 버튼 클릭 시, validate가 실행되어 value값에 입력한 값이 저장.
              if (_formKey.currentState!.validate()) {
                // 유효성 검증을 통과하면 이동.
                //Get.to(HomePage());
                String token = await u.login(
                    _username.text.trim(),
                    _password.text
                        .trim()); // trim을 사용해서 사용자가 입력한 데이터에 있을 수 있는 공백을 제거

                if (token != "-1") {
                  Get.to(() => HomePage());
                } else {
                  Get.snackbar("로그인 시도", "로그인 실패");
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text("아직 회원가입이 안되어 있나요?"),
          ),
        ],
      ),
    );
  }
}
