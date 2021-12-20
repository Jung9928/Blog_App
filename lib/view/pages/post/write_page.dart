import 'package:flutter/material.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // form상태를 관리하는 key.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                hint: "Title",
                funValidator: validateTitle(),
              ),
              CustomTextArea(
                hint: "Content",
                funValidator: validateContent(),
              ),
              CustomElevatedButton(
                text: "글쓰기",
                funPageRoute: () {
                  // !를 사용하여 절대 null값이 될 수 없음을 지정. 그리고 버튼 클릭 시, validate가 실행되어 value값에 입력한 값이 저장.
                  if (_formKey.currentState!.validate()) {
                    // 유효성 검증을 통과하면 이동.
                    Get.off(HomePage()); // 뒤로 가기를 못하도록 Get.off 사용.
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
